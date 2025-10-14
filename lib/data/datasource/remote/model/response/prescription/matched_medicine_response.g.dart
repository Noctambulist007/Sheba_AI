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
);

Map<String, dynamic> _$MatchedMedicineResponseToJson(
  _MatchedMedicineResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'generic_name': instance.genericName,
  'price': instance.price,
};
