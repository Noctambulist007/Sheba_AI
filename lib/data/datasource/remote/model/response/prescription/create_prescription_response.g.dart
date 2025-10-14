// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_prescription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePrescriptionResponse _$CreatePrescriptionResponseFromJson(
  Map<String, dynamic> json,
) => _CreatePrescriptionResponse(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
);

Map<String, dynamic> _$CreatePrescriptionResponseToJson(
  _CreatePrescriptionResponse instance,
) => <String, dynamic>{'id': instance.id, 'image': instance.image};
