// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'excuse_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ExcuseEventTearOff {
  const _$ExcuseEventTearOff();

  GetExcuseByCategoryEvent getExcuseByCategoryEvent(String category) {
    return GetExcuseByCategoryEvent(
      category,
    );
  }

  GetRandomExcuseEvent getRandomExcuseEvent() {
    return const GetRandomExcuseEvent();
  }
}

/// @nodoc
const $ExcuseEvent = _$ExcuseEventTearOff();

/// @nodoc
mixin _$ExcuseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) getExcuseByCategoryEvent,
    required TResult Function() getRandomExcuseEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String category)? getExcuseByCategoryEvent,
    TResult Function()? getRandomExcuseEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? getExcuseByCategoryEvent,
    TResult Function()? getRandomExcuseEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExcuseByCategoryEvent value)
        getExcuseByCategoryEvent,
    required TResult Function(GetRandomExcuseEvent value) getRandomExcuseEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetExcuseByCategoryEvent value)? getExcuseByCategoryEvent,
    TResult Function(GetRandomExcuseEvent value)? getRandomExcuseEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExcuseByCategoryEvent value)? getExcuseByCategoryEvent,
    TResult Function(GetRandomExcuseEvent value)? getRandomExcuseEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExcuseEventCopyWith<$Res> {
  factory $ExcuseEventCopyWith(
          ExcuseEvent value, $Res Function(ExcuseEvent) then) =
      _$ExcuseEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExcuseEventCopyWithImpl<$Res> implements $ExcuseEventCopyWith<$Res> {
  _$ExcuseEventCopyWithImpl(this._value, this._then);

  final ExcuseEvent _value;
  // ignore: unused_field
  final $Res Function(ExcuseEvent) _then;
}

/// @nodoc
abstract class $GetExcuseByCategoryEventCopyWith<$Res> {
  factory $GetExcuseByCategoryEventCopyWith(GetExcuseByCategoryEvent value,
          $Res Function(GetExcuseByCategoryEvent) then) =
      _$GetExcuseByCategoryEventCopyWithImpl<$Res>;
  $Res call({String category});
}

/// @nodoc
class _$GetExcuseByCategoryEventCopyWithImpl<$Res>
    extends _$ExcuseEventCopyWithImpl<$Res>
    implements $GetExcuseByCategoryEventCopyWith<$Res> {
  _$GetExcuseByCategoryEventCopyWithImpl(GetExcuseByCategoryEvent _value,
      $Res Function(GetExcuseByCategoryEvent) _then)
      : super(_value, (v) => _then(v as GetExcuseByCategoryEvent));

  @override
  GetExcuseByCategoryEvent get _value =>
      super._value as GetExcuseByCategoryEvent;

  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(GetExcuseByCategoryEvent(
      category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetExcuseByCategoryEvent implements GetExcuseByCategoryEvent {
  const _$GetExcuseByCategoryEvent(this.category);

  @override
  final String category;

  @override
  String toString() {
    return 'ExcuseEvent.getExcuseByCategoryEvent(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetExcuseByCategoryEvent &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  $GetExcuseByCategoryEventCopyWith<GetExcuseByCategoryEvent> get copyWith =>
      _$GetExcuseByCategoryEventCopyWithImpl<GetExcuseByCategoryEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) getExcuseByCategoryEvent,
    required TResult Function() getRandomExcuseEvent,
  }) {
    return getExcuseByCategoryEvent(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String category)? getExcuseByCategoryEvent,
    TResult Function()? getRandomExcuseEvent,
  }) {
    return getExcuseByCategoryEvent?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? getExcuseByCategoryEvent,
    TResult Function()? getRandomExcuseEvent,
    required TResult orElse(),
  }) {
    if (getExcuseByCategoryEvent != null) {
      return getExcuseByCategoryEvent(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExcuseByCategoryEvent value)
        getExcuseByCategoryEvent,
    required TResult Function(GetRandomExcuseEvent value) getRandomExcuseEvent,
  }) {
    return getExcuseByCategoryEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetExcuseByCategoryEvent value)? getExcuseByCategoryEvent,
    TResult Function(GetRandomExcuseEvent value)? getRandomExcuseEvent,
  }) {
    return getExcuseByCategoryEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExcuseByCategoryEvent value)? getExcuseByCategoryEvent,
    TResult Function(GetRandomExcuseEvent value)? getRandomExcuseEvent,
    required TResult orElse(),
  }) {
    if (getExcuseByCategoryEvent != null) {
      return getExcuseByCategoryEvent(this);
    }
    return orElse();
  }
}

abstract class GetExcuseByCategoryEvent implements ExcuseEvent {
  const factory GetExcuseByCategoryEvent(String category) =
      _$GetExcuseByCategoryEvent;

  String get category;
  @JsonKey(ignore: true)
  $GetExcuseByCategoryEventCopyWith<GetExcuseByCategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRandomExcuseEventCopyWith<$Res> {
  factory $GetRandomExcuseEventCopyWith(GetRandomExcuseEvent value,
          $Res Function(GetRandomExcuseEvent) then) =
      _$GetRandomExcuseEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetRandomExcuseEventCopyWithImpl<$Res>
    extends _$ExcuseEventCopyWithImpl<$Res>
    implements $GetRandomExcuseEventCopyWith<$Res> {
  _$GetRandomExcuseEventCopyWithImpl(
      GetRandomExcuseEvent _value, $Res Function(GetRandomExcuseEvent) _then)
      : super(_value, (v) => _then(v as GetRandomExcuseEvent));

  @override
  GetRandomExcuseEvent get _value => super._value as GetRandomExcuseEvent;
}

/// @nodoc

class _$GetRandomExcuseEvent implements GetRandomExcuseEvent {
  const _$GetRandomExcuseEvent();

  @override
  String toString() {
    return 'ExcuseEvent.getRandomExcuseEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetRandomExcuseEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) getExcuseByCategoryEvent,
    required TResult Function() getRandomExcuseEvent,
  }) {
    return getRandomExcuseEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String category)? getExcuseByCategoryEvent,
    TResult Function()? getRandomExcuseEvent,
  }) {
    return getRandomExcuseEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? getExcuseByCategoryEvent,
    TResult Function()? getRandomExcuseEvent,
    required TResult orElse(),
  }) {
    if (getRandomExcuseEvent != null) {
      return getRandomExcuseEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExcuseByCategoryEvent value)
        getExcuseByCategoryEvent,
    required TResult Function(GetRandomExcuseEvent value) getRandomExcuseEvent,
  }) {
    return getRandomExcuseEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetExcuseByCategoryEvent value)? getExcuseByCategoryEvent,
    TResult Function(GetRandomExcuseEvent value)? getRandomExcuseEvent,
  }) {
    return getRandomExcuseEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExcuseByCategoryEvent value)? getExcuseByCategoryEvent,
    TResult Function(GetRandomExcuseEvent value)? getRandomExcuseEvent,
    required TResult orElse(),
  }) {
    if (getRandomExcuseEvent != null) {
      return getRandomExcuseEvent(this);
    }
    return orElse();
  }
}

abstract class GetRandomExcuseEvent implements ExcuseEvent {
  const factory GetRandomExcuseEvent() = _$GetRandomExcuseEvent;
}
