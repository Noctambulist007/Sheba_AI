// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyze_prescription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyzePrescriptionResponse _$AnalyzePrescriptionResponseFromJson(
  Map<String, dynamic> json,
) => _AnalyzePrescriptionResponse(
  prescriptionId: (json['prescription_id'] as num).toInt(),
  extractedText: json['extracted_text'] as String,
  matchedMedicines: (json['matched_medicines'] as List<dynamic>?)
      ?.map((e) => MatchedMedicineResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  unmatchedMedicines: (json['unmatched_medicines'] as List<dynamic>?)
      ?.map(
        (e) => UnmatchedMedicineResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$AnalyzePrescriptionResponseToJson(
  _AnalyzePrescriptionResponse instance,
) => <String, dynamic>{
  'prescription_id': instance.prescriptionId,
  'extracted_text': instance.extractedText,
  'matched_medicines': instance.matchedMedicines,
  'unmatched_medicines': instance.unmatchedMedicines,
};
