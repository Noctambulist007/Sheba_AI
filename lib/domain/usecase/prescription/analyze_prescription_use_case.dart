import 'package:sheba_ai/domain/model/prescription/analyze_prescription.dart';
import 'package:sheba_ai/domain/repository/prescription_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class AnalyzePrescriptionUseCase {
  final PrescriptionRepository _prescriptionRepository;

  AnalyzePrescriptionUseCase({
    required PrescriptionRepository prescriptionRepository,
  }) : _prescriptionRepository = prescriptionRepository;

  Future<Result<AnalyzePrescription>> call({
    required int prescriptionId,
  }) async {
    return await _prescriptionRepository
        .analyzePrescription(prescriptionId: prescriptionId)
        .then((analyzePrescription) => Result.success(analyzePrescription))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
