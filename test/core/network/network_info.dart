import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_practice/core/network/network_info.dart';

import 'network_info.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test('should forward the call to InternetConnectionChecked.hasConnection', () async {
      // arrange
      final truthyHasConnection = Future.value(true);
      when(networkInfo.isConnected).thenAnswer((_) => truthyHasConnection);
      // act
      final result = networkInfo.isConnected;
      // assert
      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, truthyHasConnection);
    });
  });
}
