import 'package:sheba_ai/data/datasource/remote/api/prescription_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/prescription/create_prescription_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/prescription/analyze_prescription_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/prescription/create_prescription_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/prescription/prescription_list_response.dart';
import 'package:sheba_ai/data/datasource/remote/util/api_client.dart';
import 'package:sheba_ai/data/mapper/prescription/analyze_prescription_response_mapper.dart';
import 'package:sheba_ai/data/mapper/prescription/create_prescription_response_mapper.dart';
import 'package:sheba_ai/data/mapper/prescription/prescription_list_response_mapper.dart';
import 'package:sheba_ai/domain/model/prescription/analyze_prescription.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:dio/dio.dart';

class PrescriptionApiImpl extends PrescriptionApi {
  final ApiClient _client;

  static const getAllPrescriptionsUrl = 'prescriptions/';
  static const createPrescriptionUrl = 'prescriptions/create/';
  static const analyzePrescriptionUrl = 'prescriptions/'; // {id}/analyze/
  static const deletePrescriptionUrl = 'prescriptions/'; // {id}/delete/

  PrescriptionApiImpl({required ApiClient client}) : _client = client;

  @override
  Future<List<Prescription>> getAllPrescriptions({int? page}) async {
    final response = await _client.get<JSONObject, PrescriptionListResponse>(
      path: getAllPrescriptionsUrl,
      queryParameters: {if (page != null) 'page': page},
      converter: (json) => PrescriptionListResponse.fromJson(json),
    );
    return response.toPrescriptionList();
  }

  @override
  Future<Prescription> createPrescription({
    required CreatePrescriptionRequest requestBody,
  }) async {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(requestBody.image),
    });

    final response = await _client.post<JSONObject, CreatePrescriptionResponse>(
      path: createPrescriptionUrl,
      data: formData,
      converter: (json) => CreatePrescriptionResponse.fromJson(json),
    );
    return response.toCreatePrescription();
  }

  @override
  Future<AnalyzePrescription> analyzePrescription({
    required int prescriptionId,
  }) async {
    final response = await _client
        .post<JSONObject, AnalyzePrescriptionResponse>(
          path: '$analyzePrescriptionUrl$prescriptionId/analyze/',
          converter: (json) => AnalyzePrescriptionResponse.fromJson(json),
        );
    return response.toAnalyzePrescription();
  }

  @override
  Future<void> deletePrescription({required int prescriptionId}) async {
    return await _client.delete(
      path: '$deletePrescriptionUrl$prescriptionId/delete/',
      converter: (json) => json,
    );
  }
}
