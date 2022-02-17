import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_practice/core/errors/failures.dart';
import 'package:riverpod_practice/core/utils/types.dart';

class InputConverter {
  Either<Failure, ExcuseCategory> stringToExcuseCategory(String input) {
    if (input.isEmpty) {
      return const Left(InvalidInputFailure());
    }
    try {
      final filterResult = ExcuseCategory.values.firstWhere(
        (element) => describeEnum(element) == input.toLowerCase(),
      );
      return Right(filterResult);
    } on StateError {
      return const Left(InvalidInputFailure());
    }
  }
}
