import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';

abstract class ExcuseRepository {
  Future<Either<Failure, Excuse>> getRandomExcuse();
  Future<Either<Failure, Excuse>> getExcuseByCategory(ExcuseCategory excuseCategory);
}
