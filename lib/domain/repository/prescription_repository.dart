import 'package:sheba_ai/data/datasource/remote/model/request/prescription/create_prescription_request.dart';
import 'package:sheba_ai/domain/model/prescription/analyze_prescription.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';

abstract class PrescriptionRepository {
  Future<List<Prescription>> getAllPrescriptions({int? page});

  Future<Prescription> getPrescription({
    required int prescriptionId,
});

  Future<Prescription> createPrescription({
    required CreatePrescriptionRequest requestBody,
  });

  Future<AnalyzePrescription> analyzePrescription({
    required int prescriptionId,
  });

  Future<void> deletePrescription({required int prescriptionId});
}
