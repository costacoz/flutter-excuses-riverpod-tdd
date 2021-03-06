// Mocks generated by Mockito 5.0.17 from annotations
// in riverpod_practice/test/data/repositories/excuse_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:riverpod_practice/core/network/network_info.dart' as _i7;
import 'package:riverpod_practice/core/utils/types.dart' as _i5;
import 'package:riverpod_practice/data/datasources/excuse_local_data_source.dart'
    as _i6;
import 'package:riverpod_practice/data/datasources/excuse_remote_data_source.dart'
    as _i3;
import 'package:riverpod_practice/data/models/excuse_model.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeExcuseModel_0 extends _i1.Fake implements _i2.ExcuseModel {}

/// A class which mocks [ExcuseRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExcuseRemoteDataSource extends _i1.Mock
    implements _i3.ExcuseRemoteDataSource {
  MockExcuseRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ExcuseModel> getRandomExcuse() =>
      (super.noSuchMethod(Invocation.method(#getRandomExcuse, []),
              returnValue: Future<_i2.ExcuseModel>.value(_FakeExcuseModel_0()))
          as _i4.Future<_i2.ExcuseModel>);
  @override
  _i4.Future<_i2.ExcuseModel> getExcuseByCategory(
          _i5.ExcuseCategory? category) =>
      (super.noSuchMethod(Invocation.method(#getExcuseByCategory, [category]),
              returnValue: Future<_i2.ExcuseModel>.value(_FakeExcuseModel_0()))
          as _i4.Future<_i2.ExcuseModel>);
}

/// A class which mocks [ExcuseLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExcuseLocalDataSource extends _i1.Mock
    implements _i6.ExcuseLocalDataSource {
  MockExcuseLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ExcuseModel> getLastExcuse() =>
      (super.noSuchMethod(Invocation.method(#getLastExcuse, []),
              returnValue: Future<_i2.ExcuseModel>.value(_FakeExcuseModel_0()))
          as _i4.Future<_i2.ExcuseModel>);
  @override
  _i4.Future<void> cacheExcuse(_i2.ExcuseModel? excuse) =>
      (super.noSuchMethod(Invocation.method(#cacheExcuse, [excuse]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i7.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
