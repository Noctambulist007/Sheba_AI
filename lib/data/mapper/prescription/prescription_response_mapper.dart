import 'package:sheba_ai/domain/model/prescription/prescription.dart';

import '../../datasource/remote/model/response/prescription/prescription_response_data.dart';

extension PrescriptionResponseMapper on PrescriptionResponseData {
  Prescription toPrescription() {
    return Prescription(
      id: id,
      image: image,
      status: status,
      createdAt: createdAt,
    );
  }
}
