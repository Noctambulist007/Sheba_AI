import 'package:flutter/foundation.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/prescription/create_prescription_request.dart';
import 'package:sheba_ai/data/repository/source/remote/prescription_remote_data_source.dart';
import 'package:sheba_ai/domain/model/prescription/analyze_prescription.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/domain/repository/prescription_repository.dart';

class PrescriptionRepositoryImpl implements PrescriptionRepository {
  final PrescriptionRemoteDataSource prescriptionRemoteDataSource;

  PrescriptionRepositoryImpl({required this.prescriptionRemoteDataSource});

  @override
  Future<List<Prescription>> getAllPrescriptions({int? page}) async {
    try {
      final response = await prescriptionRemoteDataSource.getAllPrescriptions(
        page: page,
      );
      return response;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<Prescription> getPrescription({
    required int prescriptionId,
}) async {
    try {
      final response = await prescriptionRemoteDataSource.getPrescription(
        prescriptionId: prescriptionId,
      );
      return response;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<Prescription> createPrescription({
    required CreatePrescriptionRequest requestBody,
  }) async {
    try {
      final response = await prescriptionRemoteDataSource.createPrescription(
        requestBody: requestBody,
      );
      return response;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<AnalyzePrescription> analyzePrescription({
    required int prescriptionId,
  }) async {
    try {
      final response = await prescriptionRemoteDataSource.analyzePrescription(
        prescriptionId: prescriptionId,
      );
      return response;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> deletePrescription({required int prescriptionId}) async {
    try {
      await prescriptionRemoteDataSource.deletePrescription(
        prescriptionId: prescriptionId,
      );
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
