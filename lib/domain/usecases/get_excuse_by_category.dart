import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/usecases/usecase.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';
import 'package:riverpod_practice/domain/repository_contracts/excuse_repository.dart';

part 'get_excuse_by_category.freezed.dart';

class GetExcuseByCategory extends UseCase<Excuse, Params> {
  final ExcuseRepository repository;

  GetExcuseByCategory(this.repository);

  @override
  Future<Either<Failure, Excuse>> call(Params params) async {
    return await repository.getExcuseByCategory(params.excuseCategory);
  }
}

@freezed
class Params with _$Params {
  const factory Params({required ExcuseCategory excuseCategory}) = _Params;
}
