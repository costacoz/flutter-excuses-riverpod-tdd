import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_practice/core/errors/failures.dart';

part 'usecase.freezed.dart';

abstract class UseCase<UsecaseType, ParamsType> {
  Future<Either<Failure, UsecaseType>> call(ParamsType params);
}

@freezed
class NoParams with _$NoParams{
  const NoParams._();
  const factory NoParams() = _NoParams;
}
