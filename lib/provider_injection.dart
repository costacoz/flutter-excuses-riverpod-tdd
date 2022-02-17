import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_practice/core/network/network_info.dart';
import 'package:riverpod_practice/core/utils/input_converter.dart';
import 'package:riverpod_practice/data/datasources/excuse_local_data_source.dart';
import 'package:riverpod_practice/data/datasources/excuse_remote_data_source.dart';
import 'package:riverpod_practice/data/repository_implementations/excuse_repository_impl.dart';
import 'package:riverpod_practice/domain/usecases/get_excuse_by_category.dart';
import 'package:riverpod_practice/domain/usecases/get_random_excuse.dart';
import 'package:riverpod_practice/presentation/provider/excuse_notifier.dart';
import 'package:riverpod_practice/presentation/provider/excuse_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/repository_contracts/excuse_repository.dart';

// - Features

// -- Provider
final excuseNotifierProvider = StateNotifierProvider<ExcuseNotifier, ExcuseState>((ref) {
  return ExcuseNotifier(
    categoric: ref.watch(getExcuseByCategoryProvider),
    random: ref.watch(getRandomExcuseProvider),
    inputConverter: ref.watch(inputConverterProvider),
  );
});

// -- Usecases
final getRandomExcuseProvider = Provider<GetRandomExcuse>((ref) => GetRandomExcuse(ref.watch(excuseRepositoryProvider)));
final getExcuseByCategoryProvider = Provider<GetExcuseByCategory>((ref) => GetExcuseByCategory(ref.watch(excuseRepositoryProvider)));

// -- Repository

final excuseRepositoryProvider = Provider<ExcuseRepository>(
  (ref) => ExcuseRepositoryImpl(
    localDataSource: ref.watch(localDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
    remoteDataSource: ref.watch(remoteDataSourceProvider),
  ),
);

// -- Data sources

final localDataSourceProvider = Provider<ExcuseLocalDataSource>((ref) => ExcuseLocalDataSourceImpl(ref.watch(sharedPreferencesProvider)));
final remoteDataSourceProvider = Provider<ExcuseRemoteDataSource>((ref) => ExcuseRemoteDataSourceImpl(client: ref.watch(httpClientProvider)));

// - Core

final inputConverterProvider = Provider((ref) => InputConverter());
final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl(ref.watch(internetConnectionProvider)));

// - External
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) => throw UnimplementedError());

final httpClientProvider = Provider((ref) => Dio());

final internetConnectionProvider = Provider((ref) => InternetConnectionChecker());
