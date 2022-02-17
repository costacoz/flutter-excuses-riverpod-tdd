import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_practice/core/utils/types.dart';

part 'excuse.freezed.dart';

@freezed
class Excuse with _$Excuse {
  const factory Excuse({
    required ExcuseCategory category,
    required String excuse,
  }) = _Excuse;
}
