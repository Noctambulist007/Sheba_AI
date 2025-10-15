import 'package:sheba_ai/data/datasource/remote/api/prescription_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/prescription/create_prescription_request.dart';
import 'package:sheba_ai/data/repository/source/remote/prescription_remote_data_source.dart';
import 'package:sheba_ai/domain/model/prescription/analyze_prescription.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';

class PrescriptionRemoteDataSourceImpl extends PrescriptionRemoteDataSource {
  final PrescriptionApi _prescriptionApi;

  PrescriptionRemoteDataSourceImpl({required PrescriptionApi prescriptionApi})
      : _prescriptionApi = prescriptionApi;

  @override
  Future<List<Prescription>> getAllPrescriptions({int? page}) async {
    var response = await _prescriptionApi.getAllPrescriptions(page: page);
    return response;
  }

  @override
  Future<Prescription> getPrescription({
    required int prescriptionId,
}) async {
    var response = await _prescriptionApi.getPrescription(
      prescriptionId: prescriptionId,
    );
    return response;
  }

  @override
  Future<Prescription> createPrescription({
    required CreatePrescriptionRequest requestBody,
  }) async {
    var response = await _prescriptionApi.createPrescription(
        requestBody: requestBody);
    return response;
  }

  @override
  Future<AnalyzePrescription> analyzePrescription({
    required int prescriptionId,
  }) async {
    var response = await _prescriptionApi.analyzePrescription(
      prescriptionId: prescriptionId,
    );
    return response;
  }

  @override
  Future<void> deletePrescription({required int prescriptionId}) async {
    await _prescriptionApi.deletePrescription(
      prescriptionId: prescriptionId,
    );
  }
}
