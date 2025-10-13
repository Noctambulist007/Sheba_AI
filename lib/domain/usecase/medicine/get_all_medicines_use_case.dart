import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/repository/medicine_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class GetAllMedicinesUseCase {
  final MedicineRepository _medicineRepository;

  GetAllMedicinesUseCase({required MedicineRepository medicineRepository})
    : _medicineRepository = medicineRepository;

  Future<Result<List<Medicine>>> call({int? page}) async {
    return await _medicineRepository
        .getAllMedicines(page: page)
        .then((medicines) => Result.success(medicines))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
