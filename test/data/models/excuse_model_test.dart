import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/data/models/excuse_model.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const excuseModel = ExcuseModel(category: ExcuseCategory.family, excuse: "test text");

  test(
    'should be a subclass of Excuse entity',
    () async {
      expect(excuseModel.toDomain(), isA<Excuse>());
    },
  );

  test(
    'fromJson should return a valid model',
    () async {
      // arrange
      final List<dynamic> jsonList = json.decode(getFixture('excuse.json'));
      final Map<String, dynamic> jsonMap = jsonList.first;
      // act
      final result = ExcuseModel.fromJson(jsonMap);
      // assert
      expect(result, excuseModel);
    },
  );

  test(
    'should return JSON map containing the proper data',
    () async {
      // arrange
      final expectedJsonMap = {
        "category": "family",
        "excuse": "test text",
      };
      // act
      final result = excuseModel.toJson();
      // assert
      expect(result, expectedJsonMap);
    },
  );
}
