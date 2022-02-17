import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/usecases/usecase.dart';
import 'package:riverpod_practice/core/utils/input_converter.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';
import 'package:riverpod_practice/domain/usecases/get_excuse_by_category.dart';
import 'package:riverpod_practice/domain/usecases/get_random_excuse.dart';
import 'package:riverpod_practice/presentation/provider/excuse_event.dart';
import 'package:riverpod_practice/presentation/provider/excuse_notifier.dart';
import 'package:riverpod_practice/presentation/provider/excuse_state.dart';
import 'package:riverpod_practice/provider_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'excuse_notifier.mocks.dart';

@GenerateMocks([GetRandomExcuse, GetExcuseByCategory, InputConverter])
void main() {
  late MockInputConverter mockInputConverter;
  late MockGetRandomExcuse mockGetRandomExcuse;
  late MockGetExcuseByCategory mockGetExcuseByCategory;
  const excuseCategory = ExcuseCategory.office;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    mockGetExcuseByCategory = MockGetExcuseByCategory();
    mockGetRandomExcuse = MockGetRandomExcuse();
    mockInputConverter = MockInputConverter();
  });

  setUpMockInputConverterSuccess() {
    when(mockInputConverter.stringToExcuseCategory(any)).thenReturn(const Right(excuseCategory));
  }

  test('Initial state should be Empty', () async {
    // arrange
    final sharedPrefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
    ]);
    addTearDown(container.dispose);
    // assert
    expect(container.read(excuseNotifierProvider), const ExcuseState.empty());
  });

  Future<ProviderContainer> getProviderContainer({List overridesParams = const [], overrideInputConverter = false}) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    List<Override> overrides = [
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ...overridesParams,
    ];
    if (overrideInputConverter) {
      overrides.add(inputConverterProvider.overrideWithValue(mockInputConverter));
    }
    final container = ProviderContainer(overrides: overrides);
    addTearDown(container.dispose);
    return container;
  }

  group('GetExcuseByCategory', () {
    const inputString = "Office";
    const Excuse excuse = Excuse(category: ExcuseCategory.office, excuse: "test text");
    late Override categoricProviderOverride;

    setUp(() {
      categoricProviderOverride = getExcuseByCategoryProvider.overrideWithValue(mockGetExcuseByCategory);
    });

    test('should call the InputConverter to validate and convert the string to ExcuseCategory', () async {
      // arrange
      final container = await getProviderContainer(overrideInputConverter: true);
      setUpMockInputConverterSuccess();
      // act
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetExcuseByCategoryEvent(inputString));
      // assess
      verify(mockInputConverter.stringToExcuseCategory(inputString));
    });

    test('should emit [Error] when the input is invalid', () async {
      // arrange
      final container = await getProviderContainer(overrideInputConverter: true);
      when(mockInputConverter.stringToExcuseCategory(any)).thenReturn(const Left(InvalidInputFailure()));
      // act
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetExcuseByCategoryEvent(inputString));
      // assert
      expect(container.read(excuseNotifierProvider), const ExcuseState.error(message: invalidInputFailureMessage));
    });

    test('should get an argument in a proper format', () async {
      // arrange
      final container = await getProviderContainer(overridesParams: [categoricProviderOverride], overrideInputConverter: true);
      setUpMockInputConverterSuccess();
      when(mockGetExcuseByCategory(any)).thenAnswer((_) async => const Right(excuse));
      // act
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetExcuseByCategoryEvent(inputString));
      // assess
      verify(mockGetExcuseByCategory(const Params(excuseCategory: excuseCategory)));
    });

    test('should be in Empty then Loading then Loaded state containing an Excuse entity', () async {
      // arrange
      final container = await getProviderContainer(overridesParams: [categoricProviderOverride], overrideInputConverter: true);
      setUpMockInputConverterSuccess();
      when(mockGetExcuseByCategory(any)).thenAnswer((_) async => const Right(excuse));
      // act & assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.empty());
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetExcuseByCategoryEvent(inputString));
      expect(container.read(excuseNotifierProvider), const ExcuseState.loading());
      await untilCalled(mockGetExcuseByCategory(any));
      expect(container.read(excuseNotifierProvider), const ExcuseState.loaded(excuse: excuse));
    });

    test('should be in Loading then Error state when getting data fails', () async {
      // arrange
      final container = await getProviderContainer(overridesParams: [categoricProviderOverride], overrideInputConverter: true);
      setUpMockInputConverterSuccess();
      when(mockGetExcuseByCategory(any)).thenAnswer((_) async => const Left(Failure.serverFailure()));
      // act
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetExcuseByCategoryEvent(inputString));
      // assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.loading());
      // arrange
      await untilCalled(mockGetExcuseByCategory(any));
      // assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.error(message: serverFailureMessage));
    });

    test('should be in Loading then Error state with cache failure message when cache failure', () async {
      // arrange
      final container = await getProviderContainer(overridesParams: [categoricProviderOverride], overrideInputConverter: true);
      setUpMockInputConverterSuccess();
      when(mockGetExcuseByCategory(any)).thenAnswer((_) async => const Left(Failure.cacheFailure()));
      // act
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetExcuseByCategoryEvent(inputString));
      // assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.loading());
      // arrange
      await untilCalled(mockGetExcuseByCategory(any));
      // assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.error(message: cacheFailureMessage));
    });
  });

  group('GetRandomExcuse', () {
    const Excuse excuse = Excuse(category: ExcuseCategory.family, excuse: "random test text");
    late Override randomProviderOverride;

    setUp(() {
      randomProviderOverride = getRandomExcuseProvider.overrideWithValue(mockGetRandomExcuse);
    });

    test('should get data from the random use case', () async {
      // arrange
      final container = await getProviderContainer(overridesParams: [randomProviderOverride]);
      when(mockGetRandomExcuse(any)).thenAnswer((_) async => const Right(excuse));
      // act
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetRandomExcuseEvent());
      // assess
      await untilCalled(mockGetRandomExcuse(any));
      expect(container.read(excuseNotifierProvider), const ExcuseState.loaded(excuse: excuse));
    });

    test('should be in Empty then Loading then Loaded state containing an Excuse entity', () async {
      // arrange
      final container = await getProviderContainer(overridesParams: [randomProviderOverride]);
      when(mockGetRandomExcuse(any)).thenAnswer((_) async => const Right(excuse));
      // act & assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.empty());
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetRandomExcuseEvent());
      expect(container.read(excuseNotifierProvider), const ExcuseState.loading());
      await untilCalled(mockGetRandomExcuse(any));
      expect(container.read(excuseNotifierProvider), const ExcuseState.loaded(excuse: excuse));
    });

    test('should be in Loading then Error state when getting data fails', () async {
      // arrange
      final container = await getProviderContainer(overridesParams: [randomProviderOverride]);
      when(mockGetRandomExcuse(any)).thenAnswer((_) async => const Left(Failure.serverFailure()));
      // act
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetRandomExcuseEvent());
      // assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.loading());
      // arrange
      await untilCalled(mockGetRandomExcuse(any));
      // assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.error(message: serverFailureMessage));
    });

    test('should be in Loading then Error state with cache failure message when cache failure', () async {
      // arrange
      final container = await getProviderContainer(overridesParams: [randomProviderOverride]);
      when(mockGetRandomExcuse(any)).thenAnswer((_) async => const Left(Failure.cacheFailure()));
      // act
      container.read(excuseNotifierProvider.notifier).mapEventToState(const GetRandomExcuseEvent());
      // assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.loading());
      // arrange
      await untilCalled(mockGetRandomExcuse(any));
      // assess
      expect(container.read(excuseNotifierProvider), const ExcuseState.error(message: cacheFailureMessage));
    });
  });
}
