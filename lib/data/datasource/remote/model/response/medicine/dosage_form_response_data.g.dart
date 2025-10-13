// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dosage_form_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DosageFormResponseData _$DosageFormResponseDataFromJson(
  Map<String, dynamic> json,
) => _DosageFormResponseData(
  dosageFormId: (json['dosage_form_id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  genericsCount: (json['generics_count'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$DosageFormResponseDataToJson(
  _DosageFormResponseData instance,
) => <String, dynamic>{
  'dosage_form_id': instance.dosageFormId,
  'name': instance.name,
  'slug': instance.slug,
  'generics_count': instance.genericsCount,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
