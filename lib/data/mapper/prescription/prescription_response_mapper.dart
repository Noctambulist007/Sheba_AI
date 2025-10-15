import 'package:sheba_ai/data/mapper/prescription/matched_medicine_response_mapper.dart';
import 'package:sheba_ai/data/mapper/prescription/unmatched_medicine_response_mapper.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';

import '../../datasource/remote/model/response/prescription/prescription_response_data.dart';

extension PrescriptionResponseMapper on PrescriptionResponseData {
  Prescription toPrescription() {
    return Prescription(
      id: id,
      image: image,
      status: status,
      createdAt: createdAt,
      matchedMedicines: matchedMedicines
          ?.map((matchedMedicine) => matchedMedicine.toMatchedMedicine())
          .toList(),
      unmatchedMedicines: unmatchedMedicines
          ?.map((unmatchedMedicine) => unmatchedMedicine.toUnmatchedMedicine())
          .toList(),
    );
  }
}
