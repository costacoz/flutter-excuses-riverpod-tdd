import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_practice/core/errors/exception.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/data/datasources/excuse_remote_data_source.dart';
import 'package:riverpod_practice/data/models/excuse_model.dart';

import '../../fixtures/fixture_reader.dart';
import 'excuse_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late ExcuseRemoteDataSourceImpl dataSource;
  late MockDio mockHttpClient;
  late RequestOptions requestOptions;
  late Response successfulExcuseResponse;

  setUp(() {
    mockHttpClient = MockDio();
    dataSource = ExcuseRemoteDataSourceImpl(client: mockHttpClient);
    requestOptions = RequestOptions(path: '');

    successfulExcuseResponse = Response(
      data: json.decode(getFixture('excuse.json')),
      statusCode: 200,
      requestOptions: requestOptions,
    );
  });

  void setUpMockHttpClientSuccess() {
    when(
      mockHttpClient.get(any, options: anyNamed('options')),
    ).thenAnswer(
      (_) async => successfulExcuseResponse,
    );
  }

  void setUpMockHttpClientFailure() {
    when(
      mockHttpClient.get(any, options: anyNamed('options')),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 404,
        requestOptions: requestOptions,
      ),
    );
  }

  group('getExcuseByCategory', () {
    const testCategory = ExcuseCategory.office;
    test('should perform a GET request on a URL with excuse category', () async {
      // arrange
      setUpMockHttpClientSuccess();
      // act
      dataSource.getExcuseByCategory(testCategory);
      // assess
      verify(mockHttpClient.get(
        'https://excuser.herokuapp.com/v1/excuse/${describeEnum(testCategory)}/',
        options: QueryOptions.getExcuseOptions,
      ));
    });

    final testExcuseModel = ExcuseModel.fromJson(json.decode(getFixture('excuse.json')).first);

    test('should return Excuse model when the response status code is 200 (success)', () async {
      // arrange
      when(mockHttpClient.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => successfulExcuseResponse,
      );
      // act
      final result = await dataSource.getExcuseByCategory(testCategory);
      // assess
      expect(result, testExcuseModel);
    });

    test('should throw ServerException when the response code is not 200', () async {
      // arrange
      setUpMockHttpClientFailure();
      // act
      final call = dataSource.getExcuseByCategory;
      // assess
      expect(() => call(testCategory), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('getRandomExcuse', () {
    test('should perform a GET request on a URL to fetch random excuse', () async {
      // arrange
      setUpMockHttpClientSuccess();
      // act
      dataSource.getRandomExcuse();
      // assess
      verify(mockHttpClient.get(
        'https://excuser.herokuapp.com/v1/excuse/',
        options: QueryOptions.getExcuseOptions,
      ));
    });

    final testExcuseModel = ExcuseModel.fromJson(json.decode(getFixture('excuse.json')).first);

    test('should return Excuse model when the response status code is 200 (success)', () async {
      // arrange
      when(mockHttpClient.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => successfulExcuseResponse,
      );
      // act
      final result = await dataSource.getRandomExcuse();
      // assess
      expect(result, testExcuseModel);
    });

    test('should throw ServerException when the response code is not 200', () async {
      // arrange
      setUpMockHttpClientFailure();
      // act
      final call = dataSource.getRandomExcuse;
      // assess
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
