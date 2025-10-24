import 'package:sheba_ai/domain/model/prescription/matched_medicine.dart';
import 'package:sheba_ai/domain/model/prescription/unmatched_medicine.dart';

class AnalyzePrescription {
  final int prescriptionId;
  final String? extractedText;
  final List<MatchedMedicine>? matchedMedicines;
  final List<UnmatchedMedicine>? unmatchedMedicines;
  final String? error;
  final String? details;
  final int? confident;

  AnalyzePrescription({
    required this.prescriptionId,
     this.extractedText,
     this.matchedMedicines,
     this.unmatchedMedicines,
      this.error,
      this.details,
      this.confident,
  });

}