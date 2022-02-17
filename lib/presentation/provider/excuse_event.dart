import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_practice/core/utils/types.dart';

part 'excuse_event.freezed.dart';

@freezed
class ExcuseEvent with _$ExcuseEvent {
  const factory ExcuseEvent.getExcuseByCategoryEvent(String category) = GetExcuseByCategoryEvent;
  const factory ExcuseEvent.getRandomExcuseEvent() = GetRandomExcuseEvent;
}
