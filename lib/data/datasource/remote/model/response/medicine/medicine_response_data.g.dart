// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicineResponseData _$MedicineResponseDataFromJson(
  Map<String, dynamic> json,
) => _MedicineResponseData(
  medicineId: (json['medicine_id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  strength: json['strength'] as String,
  manufacturer: ManufacturerResponseData.fromJson(
    json['manufacturer'] as Map<String, dynamic>,
  ),
  generic: GenericResponseData.fromJson(
    json['generic'] as Map<String, dynamic>,
  ),
  dosageForm: DosageFormResponseData.fromJson(
    json['dosage_form'] as Map<String, dynamic>,
  ),
  price: json['price'] as String,
  formattedPrice: json['formatted_price'] as String,
  unit: json['unit'] as String,
);

Map<String, dynamic> _$MedicineResponseDataToJson(
  _MedicineResponseData instance,
) => <String, dynamic>{
  'medicine_id': instance.medicineId,
  'name': instance.name,
  'slug': instance.slug,
  'strength': instance.strength,
  'manufacturer': instance.manufacturer,
  'generic': instance.generic,
  'dosage_form': instance.dosageForm,
  'price': instance.price,
  'formatted_price': instance.formattedPrice,
  'unit': instance.unit,
};
