import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/usecases/usecase.dart';
import 'package:riverpod_practice/core/utils/input_converter.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';
import 'package:riverpod_practice/domain/usecases/get_excuse_by_category.dart';
import 'package:riverpod_practice/domain/usecases/get_random_excuse.dart';
import 'package:riverpod_practice/presentation/provider/excuse_state.dart';

import 'excuse_event.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage = 'Invalid Input - The excuse category is invalid.';
const String unexpectedErrorMessage = 'Unexpected Error!';

class ExcuseNotifier extends StateNotifier<ExcuseState> {
  /// Usecases
  final GetExcuseByCategory getExcuseByCategory;
  final GetRandomExcuse getRandomExcuse;
  final InputConverter inputConverter;

  ExcuseNotifier({
    required categoric,
    required random,
    required this.inputConverter,
  })  : assert(categoric != null),
        assert(random != null),
        getExcuseByCategory = categoric,
        getRandomExcuse = random,
        super(const ExcuseState.empty());

  Future<void> mapEventToState(ExcuseEvent event) async {
    state = const ExcuseState.loading();
    if (event is GetExcuseByCategoryEvent) {
      final inputEither = inputConverter.stringToExcuseCategory(event.category);
      inputEither.fold(
        (failure) {
          state = const ExcuseState.error(message: invalidInputFailureMessage);
        },
        (excuseCategory) async {
          _foldExcuseOrFailure(await getExcuseByCategory(Params(excuseCategory: excuseCategory)));
        },
      );
    } else if (event is GetRandomExcuseEvent) {
      _foldExcuseOrFailure(await getRandomExcuse(const NoParams()));
    }
  }

  void _foldExcuseOrFailure(Either<Failure, Excuse> excuseEither) {
    excuseEither.fold(
      (failure) => state = ExcuseState.error(message: _mapFailureToMessage(failure)),
      (excuse) => state = ExcuseState.loaded(excuse: excuse),
    );
  }

  String _mapFailureToMessage(failure) {
    return failure.maybeMap(
      serverFailure: (_) => serverFailureMessage,
      cacheFailure: (_) => cacheFailureMessage,
      invalidInputFailure: (_) => invalidInputFailureMessage,
      orElse: () => unexpectedErrorMessage,
    );
  }
}
