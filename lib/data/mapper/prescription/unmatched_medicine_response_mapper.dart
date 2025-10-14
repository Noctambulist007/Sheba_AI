import 'package:sheba_ai/data/datasource/remote/model/response/prescription/unmatched_medicine_response.dart';
import 'package:sheba_ai/domain/model/prescription/unmatched_medicine.dart';

extension UnmatchedMedicineResponseMapper on UnmatchedMedicineResponse {
  UnmatchedMedicine toUnmatchedMedicine() {
    return UnmatchedMedicine(name: name);
  }
}
