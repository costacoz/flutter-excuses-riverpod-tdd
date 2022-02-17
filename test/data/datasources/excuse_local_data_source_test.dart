import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_practice/core/errors/exception.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/data/datasources/excuse_local_data_source.dart';
import 'package:riverpod_practice/data/models/excuse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fixtures/fixture_reader.dart';
import 'excuse_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late ExcuseLocalDataSourceImpl excuseLocalDataSourceImpl;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    excuseLocalDataSourceImpl = ExcuseLocalDataSourceImpl(mockSharedPreferences);
  });
  
  group('getLastExcuse', () {
    final testJsonExcuseModel = ExcuseModel.fromJson(json.decode(getFixture('excuse_cached.json')));
    
    test('should return Excuse from the cache, when there is one in the cache', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(getFixture('excuse_cached.json'));
      // act
      final result = await excuseLocalDataSourceImpl.getLastExcuse();
      // assess
      verify(mockSharedPreferences.getString(cachedExcuse));
      expect(result, testJsonExcuseModel);
    });

    test('should throw a CacheException when there is no cached value', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // act
      final call = excuseLocalDataSourceImpl.getLastExcuse;
      // assess
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });

    group('cacheExcuse', () {
      const testExcuseModel = ExcuseModel(category: ExcuseCategory.party, excuse: "test text");

      test('should call SharedPreferences to cache the data', () async {
        // arrange
        when(mockSharedPreferences.setString(cachedExcuse, any)).thenAnswer((_) async => true);
        // act
        excuseLocalDataSourceImpl.cacheExcuse(testExcuseModel);
        // assess
        final expectedJsonString = json.encode(testExcuseModel.toJson());
        verify(mockSharedPreferences.setString(cachedExcuse, expectedJsonString));
      });
    });

  });
}
