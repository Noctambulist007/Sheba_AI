// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrescriptionListResponse _$PrescriptionListResponseFromJson(
  Map<String, dynamic> json,
) => _PrescriptionListResponse(
  success: json['success'] as bool,
  data: PrescriptionListData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PrescriptionListResponseToJson(
  _PrescriptionListResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
