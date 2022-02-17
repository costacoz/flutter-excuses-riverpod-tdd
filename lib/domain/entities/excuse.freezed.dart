// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'excuse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ExcuseTearOff {
  const _$ExcuseTearOff();

  _Excuse call({required ExcuseCategory category, required String excuse}) {
    return _Excuse(
      category: category,
      excuse: excuse,
    );
  }
}

/// @nodoc
const $Excuse = _$ExcuseTearOff();

/// @nodoc
mixin _$Excuse {
  ExcuseCategory get category => throw _privateConstructorUsedError;
  String get excuse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExcuseCopyWith<Excuse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExcuseCopyWith<$Res> {
  factory $ExcuseCopyWith(Excuse value, $Res Function(Excuse) then) =
      _$ExcuseCopyWithImpl<$Res>;
  $Res call({ExcuseCategory category, String excuse});
}

/// @nodoc
class _$ExcuseCopyWithImpl<$Res> implements $ExcuseCopyWith<$Res> {
  _$ExcuseCopyWithImpl(this._value, this._then);

  final Excuse _value;
  // ignore: unused_field
  final $Res Function(Excuse) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? excuse = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExcuseCategory,
      excuse: excuse == freezed
          ? _value.excuse
          : excuse // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ExcuseCopyWith<$Res> implements $ExcuseCopyWith<$Res> {
  factory _$ExcuseCopyWith(_Excuse value, $Res Function(_Excuse) then) =
      __$ExcuseCopyWithImpl<$Res>;
  @override
  $Res call({ExcuseCategory category, String excuse});
}

/// @nodoc
class __$ExcuseCopyWithImpl<$Res> extends _$ExcuseCopyWithImpl<$Res>
    implements _$ExcuseCopyWith<$Res> {
  __$ExcuseCopyWithImpl(_Excuse _value, $Res Function(_Excuse) _then)
      : super(_value, (v) => _then(v as _Excuse));

  @override
  _Excuse get _value => super._value as _Excuse;

  @override
  $Res call({
    Object? category = freezed,
    Object? excuse = freezed,
  }) {
    return _then(_Excuse(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExcuseCategory,
      excuse: excuse == freezed
          ? _value.excuse
          : excuse // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Excuse with DiagnosticableTreeMixin implements _Excuse {
  const _$_Excuse({required this.category, required this.excuse});

  @override
  final ExcuseCategory category;
  @override
  final String excuse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Excuse(category: $category, excuse: $excuse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Excuse'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('excuse', excuse));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Excuse &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.excuse, excuse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(excuse));

  @JsonKey(ignore: true)
  @override
  _$ExcuseCopyWith<_Excuse> get copyWith =>
      __$ExcuseCopyWithImpl<_Excuse>(this, _$identity);
}

abstract class _Excuse implements Excuse {
  const factory _Excuse(
      {required ExcuseCategory category, required String excuse}) = _$_Excuse;

  @override
  ExcuseCategory get category;
  @override
  String get excuse;
  @override
  @JsonKey(ignore: true)
  _$ExcuseCopyWith<_Excuse> get copyWith => throw _privateConstructorUsedError;
}
