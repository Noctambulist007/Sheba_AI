import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/domain/repository/prescription_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class GetPrescriptionUseCase {
  final PrescriptionRepository _prescriptionRepository;

  GetPrescriptionUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  Future<Result<Prescription>> call({required int prescriptionId}) async {
    return await _prescriptionRepository
        .getPrescription(prescriptionId: prescriptionId)
        .then((prescription) => Result.success(prescription))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
