import 'package:sheba_ai/domain/model/prescription/matched_medicine.dart';
import 'package:sheba_ai/domain/model/prescription/unmatched_medicine.dart';

class Prescription {
  final int id;
  final String image;
  final String status;
  final String createdAt;
  final List<MatchedMedicine>? matchedMedicines;
  final List<UnmatchedMedicine>? unmatchedMedicines;

  Prescription({
    required this.id,
    required this.image,
    required this.status,
    required this.createdAt,
    this.matchedMedicines,
    this.unmatchedMedicines,
  });
}
