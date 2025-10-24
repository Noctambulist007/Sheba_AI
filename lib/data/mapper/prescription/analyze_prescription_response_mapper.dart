import 'package:sheba_ai/data/datasource/remote/model/response/prescription/analyze_prescription_response.dart';
import 'package:sheba_ai/data/mapper/prescription/matched_medicine_response_mapper.dart';
import 'package:sheba_ai/data/mapper/prescription/unmatched_medicine_response_mapper.dart';
import 'package:sheba_ai/domain/model/prescription/analyze_prescription.dart';

extension AnalyzePrescriptionResponseMapper on AnalyzePrescriptionResponse {
  AnalyzePrescription toAnalyzePrescription() {
    return AnalyzePrescription(
      prescriptionId: prescriptionId,
      extractedText: extractedText,
      matchedMedicines: matchedMedicines?.map((e) => e.toMatchedMedicine()).toList(),
      unmatchedMedicines: unmatchedMedicines?.map((e) => e.toUnmatchedMedicine()).toList(),
      error: error,
      details: details,
      confident: confident,
    );
  }
}

