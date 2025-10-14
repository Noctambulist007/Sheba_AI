import 'package:sheba_ai/data/datasource/remote/model/response/prescription/prescription_list_response.dart';
import 'package:sheba_ai/data/mapper/prescription/prescription_response_mapper.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';

extension PrescriptionListResponseMapper on PrescriptionListResponse {
  List<Prescription> toPrescriptionList() {
    return data.results.map((e) => e.toPrescription()).toList();
  }
}
