import 'package:sheba_ai/data/datasource/remote/model/response/prescription/matched_medicine_response.dart';
import 'package:sheba_ai/domain/model/prescription/matched_medicine.dart';

extension MatchedMedicineResponseMapper on MatchedMedicineResponse {
  MatchedMedicine toMatchedMedicine() {
    return MatchedMedicine(
      id: id,
      name: name,
      genericName: genericName,
      price: price,
    );
  }
}