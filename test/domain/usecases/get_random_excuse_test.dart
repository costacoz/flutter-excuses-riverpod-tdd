import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_practice/core/usecases/usecase.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';
import 'package:riverpod_practice/domain/repository_contracts/excuse_repository.dart';
import 'package:riverpod_practice/domain/usecases/get_random_excuse.dart';

import 'get_random_excuse_test.mocks.dart';

@GenerateMocks([ExcuseRepository])
void main() {
  late GetRandomExcuse usecase;
  late MockExcuseRepository mockExcuseRepository;

  setUp(() {
    mockExcuseRepository = MockExcuseRepository();
    usecase = GetRandomExcuse(mockExcuseRepository);
  });

  const exampleExcuse = Excuse(category: ExcuseCategory.office, excuse: "example");

  test(
    'should get random excuse from the repository',
    () async {
      // arrange
      when(mockExcuseRepository.getRandomExcuse()).thenAnswer((_) async => const Right(exampleExcuse));
      // act
      final result = await usecase(const NoParams());
      // assert
      expect(result, const Right(exampleExcuse));
      verify(mockExcuseRepository.getRandomExcuse());
      verifyNoMoreInteractions(mockExcuseRepository);
    },
  );
}
