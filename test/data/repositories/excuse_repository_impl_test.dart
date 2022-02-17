import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_practice/core/errors/exception.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/network/network_info.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/data/datasources/excuse_local_data_source.dart';
import 'package:riverpod_practice/data/datasources/excuse_remote_data_source.dart';
import 'package:riverpod_practice/data/models/excuse_model.dart';
import 'package:riverpod_practice/data/repository_implementations/excuse_repository_impl.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';

import 'excuse_repository_impl_test.mocks.dart';

@GenerateMocks([ExcuseRemoteDataSource, ExcuseLocalDataSource, NetworkInfo])
void main() {
  late ExcuseRepositoryImpl repository;
  late MockExcuseRemoteDataSource mockExcuseRemoteDataSource;
  late MockExcuseLocalDataSource mockExcuseLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockExcuseRemoteDataSource = MockExcuseRemoteDataSource();
    mockExcuseLocalDataSource = MockExcuseLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ExcuseRepositoryImpl(
      remoteDataSource: mockExcuseRemoteDataSource,
      localDataSource: mockExcuseLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function onlineTests) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      onlineTests();
    });
  }

  void runTestsOffline(Function offlineTests) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      offlineTests();
    });
  }

  group('getExcuseByCategory', () {
    const category = ExcuseCategory.family;
    const excuseModel = ExcuseModel(category: category, excuse: "test text");
    final Excuse excuse = excuseModel.toDomain();

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockExcuseRemoteDataSource.getExcuseByCategory(any)).thenAnswer((_) async => excuseModel);
      // act
      repository.getExcuseByCategory(category);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        when(mockExcuseRemoteDataSource.getExcuseByCategory(any)).thenAnswer((_) async => excuseModel);
        // act
        final result = await repository.getExcuseByCategory(category);
        // assert
        verify(mockExcuseRemoteDataSource.getExcuseByCategory(category));
        expect(result, Right(excuse));
      });
      test('should cache the data locally when the call to remote data source is successful', () async {
        // arrange
        when(mockExcuseRemoteDataSource.getExcuseByCategory(any)).thenAnswer((_) async => excuseModel);
        // act
        await repository.getExcuseByCategory(category);
        // assert
        verify(mockExcuseRemoteDataSource.getExcuseByCategory(category));
        verify(mockExcuseLocalDataSource.cacheExcuse(excuseModel));
      });
      test('should return ServerFailure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockExcuseRemoteDataSource.getExcuseByCategory(any)).thenThrow(ServerException());
        // act
        final result = await repository.getExcuseByCategory(category);
        // assert
        verify(mockExcuseRemoteDataSource.getExcuseByCategory(category));
        verifyZeroInteractions(mockExcuseLocalDataSource);
        expect(result, const Left(ServerFailure()));
      });
    });

    runTestsOffline(() {
      test('should return the last cached data when the cached data is present', () async {
        // arrange
        when(mockExcuseLocalDataSource.getLastExcuse()).thenAnswer((_) async => excuseModel);
        // act
        final result = await repository.getExcuseByCategory(category);
        // assert
        verify(mockExcuseLocalDataSource.getLastExcuse());
        verifyZeroInteractions(mockExcuseRemoteDataSource);
        expect(result, Right(excuseModel.toDomain()));
      });
      test('should return CacheFailure when there is no cached data present', () async {
        // arrange
        when(mockExcuseLocalDataSource.getLastExcuse()).thenThrow(CacheException());
        // act
        final result = await repository.getExcuseByCategory(category);
        // assert
        verify(mockExcuseLocalDataSource.getLastExcuse());
        verifyZeroInteractions(mockExcuseRemoteDataSource);
        expect(result, const Left(CacheFailure()));
      });
    });
  });

  group('getRandomExcuse', () {
    const category = ExcuseCategory.family;
    const excuseModel = ExcuseModel(category: category, excuse: "test text");
    final Excuse excuse = excuseModel.toDomain();

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockExcuseRemoteDataSource.getRandomExcuse()).thenAnswer((_) async => excuseModel);
      // act
      repository.getRandomExcuse();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        when(mockExcuseRemoteDataSource.getRandomExcuse()).thenAnswer((_) async => excuseModel);
        // act
        final result = await repository.getRandomExcuse();
        // assert
        verify(mockExcuseRemoteDataSource.getRandomExcuse());
        expect(result, Right(excuse));
      });
      test('should cache the data locally when the call to remote data source is successful', () async {
        // arrange
        when(mockExcuseRemoteDataSource.getRandomExcuse()).thenAnswer((_) async => excuseModel);
        // act
        await repository.getRandomExcuse();
        // assert
        verify(mockExcuseRemoteDataSource.getRandomExcuse());
        verify(mockExcuseLocalDataSource.cacheExcuse(excuseModel));
      });
      test('should return ServerFailure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockExcuseRemoteDataSource.getRandomExcuse()).thenThrow(ServerException());
        // act
        final result = await repository.getRandomExcuse();
        // assert
        verify(mockExcuseRemoteDataSource.getRandomExcuse());
        verifyZeroInteractions(mockExcuseLocalDataSource);
        expect(result, const Left(ServerFailure()));
      });
    });

    runTestsOffline(() {
      test('should return the last cached data when the cached data is present', () async {
        // arrange
        when(mockExcuseLocalDataSource.getLastExcuse()).thenAnswer((_) async => excuseModel);
        // act
        final result = await repository.getRandomExcuse();
        // assert
        verify(mockExcuseLocalDataSource.getLastExcuse());
        verifyZeroInteractions(mockExcuseRemoteDataSource);
        expect(result, Right(excuseModel.toDomain()));
      });
      test('should return CacheFailure when there is no cached data present', () async {
        // arrange
        when(mockExcuseLocalDataSource.getLastExcuse()).thenThrow(CacheException());
        // act
        final result = await repository.getRandomExcuse();
        // assert
        verify(mockExcuseLocalDataSource.getLastExcuse());
        verifyZeroInteractions(mockExcuseRemoteDataSource);
        expect(result, const Left(CacheFailure()));
      });
    });
  });
}
