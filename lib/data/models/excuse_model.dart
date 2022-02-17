import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_practice/core/utils/types.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';

part 'excuse_model.g.dart';

part 'excuse_model.freezed.dart';

@freezed
class ExcuseModel with _$ExcuseModel {
  const ExcuseModel._();

  const factory ExcuseModel({
    required ExcuseCategory category,
    required String excuse,
  }) = _ExcuseModel;

  factory ExcuseModel.fromJson(json) => _$ExcuseModelFromJson(json);

  Excuse toDomain() {
    return Excuse(category: category, excuse: excuse);
  }
}

