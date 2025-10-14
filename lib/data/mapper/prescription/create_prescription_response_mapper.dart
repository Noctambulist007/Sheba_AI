import 'package:sheba_ai/data/datasource/remote/model/response/prescription/create_prescription_response.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';

extension CreatePrescriptionResponseMapper on CreatePrescriptionResponse {
  Prescription toCreatePrescription() {
    return Prescription(
      id: id,
      image: image,
      status: '',
      createdAt: '',
    );
  }
}
