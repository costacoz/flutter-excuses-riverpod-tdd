import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/core/errors/exception.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/network/network_info.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/data/datasources/excuse_local_data_source.dart';
import 'package:riverpod_practice/data/datasources/excuse_remote_data_source.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';
import 'package:riverpod_practice/domain/repository_contracts/excuse_repository.dart';

class ExcuseRepositoryImpl implements ExcuseRepository {
  final ExcuseRemoteDataSource remoteDataSource;
  final ExcuseLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ExcuseRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  Future<Either<Failure, Excuse>> _getExcuse(getRandomOrByCategory) async {
    if (await networkInfo.isConnected) {
      try {
        final excuseModel = await getRandomOrByCategory();
        localDataSource.cacheExcuse(excuseModel);
        return Right(excuseModel.toDomain());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      try {
        final lastCachedExcuse = await localDataSource.getLastExcuse();
        return Right(lastCachedExcuse.toDomain());
      } on CacheException {
        return const Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Excuse>> getExcuseByCategory(ExcuseCategory excuseCategory) async {
    return await _getExcuse(() => remoteDataSource.getExcuseByCategory(excuseCategory));
  }

  @override
  Future<Either<Failure, Excuse>> getRandomExcuse() async {
    return await _getExcuse(() => remoteDataSource.getRandomExcuse());
  }
}
