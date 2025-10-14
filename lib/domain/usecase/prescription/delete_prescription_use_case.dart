import 'package:sheba_ai/domain/repository/prescription_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class DeletePrescriptionUseCase {
  final PrescriptionRepository _prescriptionRepository;

  DeletePrescriptionUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  Future<Result<void>> call({required int prescriptionId}) async {
    return _prescriptionRepository
        .deletePrescription(prescriptionId: prescriptionId)
        .then((_) => const Result.success(null))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
