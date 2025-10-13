// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenericResponseData _$GenericResponseDataFromJson(Map<String, dynamic> json) =>
    _GenericResponseData(
      genericId: (json['generic_id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      brandNamesCount: (json['brand_names_count'] as num).toInt(),
    );

Map<String, dynamic> _$GenericResponseDataToJson(
  _GenericResponseData instance,
) => <String, dynamic>{
  'generic_id': instance.genericId,
  'name': instance.name,
  'slug': instance.slug,
  'brand_names_count': instance.brandNamesCount,
};
