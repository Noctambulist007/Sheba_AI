// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManufacturerResponseData _$ManufacturerResponseDataFromJson(
  Map<String, dynamic> json,
) => _ManufacturerResponseData(
  manufacturerId: (json['manufacturer_id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  genericsCount: (json['generics_count'] as num).toInt(),
  brandNamesCount: (json['brand_names_count'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$ManufacturerResponseDataToJson(
  _ManufacturerResponseData instance,
) => <String, dynamic>{
  'manufacturer_id': instance.manufacturerId,
  'name': instance.name,
  'slug': instance.slug,
  'generics_count': instance.genericsCount,
  'brand_names_count': instance.brandNamesCount,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
