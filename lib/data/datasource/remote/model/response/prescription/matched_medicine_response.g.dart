// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_medicine_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchedMedicineResponse _$MatchedMedicineResponseFromJson(
  Map<String, dynamic> json,
) => _MatchedMedicineResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  genericName: json['generic_name'] as String,
  price: json['price'] as String,
  extractDetails: json['extract_details'] == null
      ? null
      : ExtractDetails.fromJson(
          json['extract_details'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MatchedMedicineResponseToJson(
  _MatchedMedicineResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'generic_name': instance.genericName,
  'price': instance.price,
  'extract_details': instance.extractDetails,
};

_ExtractDetails _$ExtractDetailsFromJson(Map<String, dynamic> json) =>
    _ExtractDetails(
      strength: json['strength'] as String?,
      frequency: json['frequency'] as String?,
      duration: json['duration'] as String?,
      instructions: json['instructions'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ExtractDetailsToJson(_ExtractDetails instance) =>
    <String, dynamic>{
      'strength': instance.strength,
      'frequency': instance.frequency,
      'duration': instance.duration,
      'instructions': instance.instructions,
      'type': instance.type,
    };
