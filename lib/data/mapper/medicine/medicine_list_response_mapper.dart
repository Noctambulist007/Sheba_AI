import 'package:sheba_ai/data/datasource/remote/model/response/medicine/medicine_list_response.dart';
import 'package:sheba_ai/data/mapper/medicine/medicine_response_mapper.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';

extension MedicineListResponseMapper on MedicineListResponse {
  List<Medicine> toMedicineList() {
    return data.results.map((e) => e.toMedicine()).toList();
  }
}
