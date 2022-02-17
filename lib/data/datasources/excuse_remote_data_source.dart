import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_practice/core/errors/exception.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/data/models/excuse_model.dart';

abstract class ExcuseRemoteDataSource {
  /// Calls the https://excuser.herokuapp.com/v1/excuse endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ExcuseModel> getRandomExcuse();

  /// Calls the https://excuser.herokuapp.com/v1/excuse/{category}/ endpoint.
  ///
  ///  Throws a [ServerException] for all error codes.
  Future<ExcuseModel> getExcuseByCategory(ExcuseCategory category);
}

/// Small overhead to test Dio request with options.
/// Otherwise use this approach - https://stackoverflow.com/a/64935059/7017890
/// As Mockito cannot test with nested objects - https://github.com/dart-lang/mockito/issues/280#issuecomment-695878156
class QueryOptions {
  static Options getExcuseOptions = Options(headers: {'Content-Type': 'application/json'});
}

class ExcuseRemoteDataSourceImpl implements ExcuseRemoteDataSource {
  final Dio client;

  ExcuseRemoteDataSourceImpl({required this.client});

  Future<ExcuseModel> _getExcuseFromUrl(url) async {
    final response = await client.get(
      url,
      options: QueryOptions.getExcuseOptions,
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }

    var excuse;

    /// Sometimes API gives incorrect key in the excuse.
    try {
      excuse = ExcuseModel.fromJson(response.data.first);
    } catch (e) {
      print(e);
      throw ServerException();
    }

    return excuse;
  }

  @override
  Future<ExcuseModel> getExcuseByCategory(ExcuseCategory category) async {
    return await _getExcuseFromUrl('https://excuser.herokuapp.com/v1/excuse/${describeEnum(category)}/');
  }

  @override
  Future<ExcuseModel> getRandomExcuse() async {
    return await _getExcuseFromUrl('https://excuser.herokuapp.com/v1/excuse/');
  }
}
