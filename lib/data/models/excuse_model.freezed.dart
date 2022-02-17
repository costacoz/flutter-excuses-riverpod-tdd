// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'excuse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExcuseModel _$ExcuseModelFromJson(Map<String, dynamic> json) {
  return _ExcuseModel.fromJson(json);
}

/// @nodoc
class _$ExcuseModelTearOff {
  const _$ExcuseModelTearOff();

  _ExcuseModel call(
      {required ExcuseCategory category, required String excuse}) {
    return _ExcuseModel(
      category: category,
      excuse: excuse,
    );
  }

  ExcuseModel fromJson(Map<String, Object?> json) {
    return ExcuseModel.fromJson(json);
  }
}

/// @nodoc
const $ExcuseModel = _$ExcuseModelTearOff();

/// @nodoc
mixin _$ExcuseModel {
  ExcuseCategory get category => throw _privateConstructorUsedError;
  String get excuse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExcuseModelCopyWith<ExcuseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExcuseModelCopyWith<$Res> {
  factory $ExcuseModelCopyWith(
          ExcuseModel value, $Res Function(ExcuseModel) then) =
      _$ExcuseModelCopyWithImpl<$Res>;
  $Res call({ExcuseCategory category, String excuse});
}

/// @nodoc
class _$ExcuseModelCopyWithImpl<$Res> implements $ExcuseModelCopyWith<$Res> {
  _$ExcuseModelCopyWithImpl(this._value, this._then);

  final ExcuseModel _value;
  // ignore: unused_field
  final $Res Function(ExcuseModel) _then;

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
abstract class _$ExcuseModelCopyWith<$Res>
    implements $ExcuseModelCopyWith<$Res> {
  factory _$ExcuseModelCopyWith(
          _ExcuseModel value, $Res Function(_ExcuseModel) then) =
      __$ExcuseModelCopyWithImpl<$Res>;
  @override
  $Res call({ExcuseCategory category, String excuse});
}

/// @nodoc
class __$ExcuseModelCopyWithImpl<$Res> extends _$ExcuseModelCopyWithImpl<$Res>
    implements _$ExcuseModelCopyWith<$Res> {
  __$ExcuseModelCopyWithImpl(
      _ExcuseModel _value, $Res Function(_ExcuseModel) _then)
      : super(_value, (v) => _then(v as _ExcuseModel));

  @override
  _ExcuseModel get _value => super._value as _ExcuseModel;

  @override
  $Res call({
    Object? category = freezed,
    Object? excuse = freezed,
  }) {
    return _then(_ExcuseModel(
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
@JsonSerializable()
class _$_ExcuseModel extends _ExcuseModel {
  const _$_ExcuseModel({required this.category, required this.excuse})
      : super._();

  factory _$_ExcuseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExcuseModelFromJson(json);

  @override
  final ExcuseCategory category;
  @override
  final String excuse;

  @override
  String toString() {
    return 'ExcuseModel(category: $category, excuse: $excuse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExcuseModel &&
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
  _$ExcuseModelCopyWith<_ExcuseModel> get copyWith =>
      __$ExcuseModelCopyWithImpl<_ExcuseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExcuseModelToJson(this);
  }
}

abstract class _ExcuseModel extends ExcuseModel {
  const factory _ExcuseModel(
      {required ExcuseCategory category,
      required String excuse}) = _$_ExcuseModel;
  const _ExcuseModel._() : super._();

  factory _ExcuseModel.fromJson(Map<String, dynamic> json) =
      _$_ExcuseModel.fromJson;

  @override
  ExcuseCategory get category;
  @override
  String get excuse;
  @override
  @JsonKey(ignore: true)
  _$ExcuseModelCopyWith<_ExcuseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
