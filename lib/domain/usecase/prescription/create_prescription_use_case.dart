import 'package:sheba_ai/data/datasource/remote/model/request/prescription/create_prescription_request.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/domain/repository/prescription_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class CreatePrescriptionUseCase {
  final PrescriptionRepository _prescriptionRepository;

  CreatePrescriptionUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  Future<Result<Prescription>> call({
    required CreatePrescriptionRequest requestBody,
  }) async {
    return await _prescriptionRepository
        .createPrescription(requestBody: requestBody)
        .then((prescription) => Result.success(prescription))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
