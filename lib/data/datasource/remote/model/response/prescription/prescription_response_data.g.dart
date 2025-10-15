// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrescriptionResponseData _$PrescriptionResponseDataFromJson(
  Map<String, dynamic> json,
) => _PrescriptionResponseData(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  matchedMedicines: (json['matched_medicines'] as List<dynamic>?)
      ?.map((e) => MatchedMedicineResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  unmatchedMedicines: (json['unmatched_medicines'] as List<dynamic>?)
      ?.map(
        (e) => UnmatchedMedicineResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PrescriptionResponseDataToJson(
  _PrescriptionResponseData instance,
) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
  'status': instance.status,
  'created_at': instance.createdAt,
  'matched_medicines': instance.matchedMedicines,
  'unmatched_medicines': instance.unmatchedMedicines,
};
