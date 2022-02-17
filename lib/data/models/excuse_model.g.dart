// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excuse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExcuseModel _$$_ExcuseModelFromJson(Map<String, dynamic> json) =>
    _$_ExcuseModel(
      category: $enumDecode(_$ExcuseCategoryEnumMap, json['category']),
      excuse: json['excuse'] as String,
    );

Map<String, dynamic> _$$_ExcuseModelToJson(_$_ExcuseModel instance) =>
    <String, dynamic>{
      'category': _$ExcuseCategoryEnumMap[instance.category],
      'excuse': instance.excuse,
    };

const _$ExcuseCategoryEnumMap = {
  ExcuseCategory.family: 'family',
  ExcuseCategory.office: 'office',
  ExcuseCategory.children: 'children',
  ExcuseCategory.college: 'college',
  ExcuseCategory.party: 'party',
};
