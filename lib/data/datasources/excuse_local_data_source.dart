import 'dart:convert';

import 'package:riverpod_practice/core/errors/exception.dart';
import 'package:riverpod_practice/data/models/excuse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedExcuse = 'CACHED_EXCUSE';

abstract class ExcuseLocalDataSource {
  /// Gets the cached [ExcuseModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws a [NoLocalDataException] if no cached data is present.
  Future<ExcuseModel> getLastExcuse();

  Future<void> cacheExcuse(ExcuseModel excuse);
}

class ExcuseLocalDataSourceImpl implements ExcuseLocalDataSource {
  final SharedPreferences sharedPreferences;

  ExcuseLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheExcuse(ExcuseModel excuse) {
    return sharedPreferences.setString(cachedExcuse, json.encode(excuse.toJson()));
  }

  @override
  Future<ExcuseModel> getLastExcuse() {
    final jsonString = sharedPreferences.getString(cachedExcuse);
    if (jsonString == null) {
      throw CacheException();
    }
    // Future.value, because shared_preferences is synchronous, while other such libs typically aren't.
    // Need it to keep the appropriate return type.
    return Future.value(ExcuseModel.fromJson(json.decode(jsonString)));
  }
}
