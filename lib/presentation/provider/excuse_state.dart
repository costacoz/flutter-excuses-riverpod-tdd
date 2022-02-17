import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_practice/domain/entities/excuse.dart';

part 'excuse_state.freezed.dart';

@freezed
class ExcuseState with _$ExcuseState {
  const factory ExcuseState.empty() = _Empty;
  const factory ExcuseState.loading() = _Loading;
  const factory ExcuseState.loaded({ required Excuse excuse }) = _Loaded;
  const factory ExcuseState.error({ required String message }) = _Error;
}