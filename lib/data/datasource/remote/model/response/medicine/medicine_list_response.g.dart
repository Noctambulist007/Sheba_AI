// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicineListResponse _$MedicineListResponseFromJson(
  Map<String, dynamic> json,
) => _MedicineListResponse(
  success: json['success'] as bool,
  data: MedicineListData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MedicineListResponseToJson(
  _MedicineListResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
