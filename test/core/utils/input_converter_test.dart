import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/utils/input_converter.dart';
import 'package:riverpod_practice/core/utils/types.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsigned', () {

    test('should return an ExcuseCategory when the string represents capitalized excuse category', () async {
      const input = "Office";

      final result = inputConverter.stringToExcuseCategory(input);

      expect(result, const Right(ExcuseCategory.office));
    });

    test('should return an ExcuseCategory when the string represents excuse category', () async {
      const input = "office";

      final result = inputConverter.stringToExcuseCategory(input);

      expect(result, const Right(ExcuseCategory.office));
    });

    test('should return a failure when the string is empty', () async {
      const input = "";

      final result = inputConverter.stringToExcuseCategory(input);

      expect(result, const Left(InvalidInputFailure()));
    });

    test('should return a failure when no such category', () async {
      const input = "abc";

      final result = inputConverter.stringToExcuseCategory(input);

      expect(result, const Left(InvalidInputFailure()));
    });
  });

}
