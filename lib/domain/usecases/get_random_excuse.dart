import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/usecases/usecase.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';
import 'package:riverpod_practice/domain/repository_contracts/excuse_repository.dart';

class GetRandomExcuse extends UseCase<Excuse, NoParams> {
  final ExcuseRepository repository;

  GetRandomExcuse(this.repository);

  @override
  Future<Either<Failure, Excuse>> call(NoParams params) async {
    return await repository.getRandomExcuse();
  }
}
