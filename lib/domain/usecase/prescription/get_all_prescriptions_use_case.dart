import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/domain/repository/prescription_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class GetAllPrescriptionsUseCase {
  final PrescriptionRepository _prescriptionRepository;

  GetAllPrescriptionsUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  Future<Result<List<Prescription>>> call({int? page}) async {
    return await _prescriptionRepository
        .getAllPrescriptions(page: page)
        .then((prescriptions) => Result.success(prescriptions))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
