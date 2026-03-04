import 'package:flutter/foundation.dart';
import 'package:sheba_ai/data/repository/source/remote/medicine_remote_data_source.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/repository/medicine_repository.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineRemoteDataSource medicineRemoteDataSource;

  MedicineRepositoryImpl({required this.medicineRemoteDataSource});

  @override
  Future<List<Medicine>> getAllMedicines({int? page, String? search}) async {
    try {
      final response = await medicineRemoteDataSource.getAllMedicines(
        page: page,
        search: search,
      );
      return response;
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
