import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/prescription/matched_medicine_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/prescription/prescription_list_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/prescription/unmatched_medicine_response.dart';

part 'analyze_prescription_response.freezed.dart';
part 'analyze_prescription_response.g.dart';

@freezed
abstract class AnalyzePrescriptionResponse with _$AnalyzePrescriptionResponse{
  const factory AnalyzePrescriptionResponse({
    @JsonKey(name: 'prescription_id') required int prescriptionId,
    @JsonKey(name: 'extracted_text') required String extractedText,
    @JsonKey(name: 'matched_medicines')  List<MatchedMedicineResponse>? matchedMedicines,
    @JsonKey(name: 'unmatched_medicines')  List<UnmatchedMedicineResponse>? unmatchedMedicines,
    @JsonKey(name: 'error') String? error,
    @JsonKey(name: 'details') String? details,
    @JsonKey(name: 'confident') int? confident,

  }) = _AnalyzePrescriptionResponse;

  factory AnalyzePrescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$AnalyzePrescriptionResponseFromJson(json);
}
