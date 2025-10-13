import 'package:sheba_ai/data/datasource/remote/api/medicine_api.dart';
import 'package:sheba_ai/data/repository/source/remote/medicine_remote_data_source.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';

class MedicineRemoteDataSourceImpl extends MedicineRemoteDataSource {
  final MedicineApi _medicineApi;

  MedicineRemoteDataSourceImpl({required MedicineApi medicineApi})
    : _medicineApi = medicineApi;

  @override
  Future<List<Medicine>> getAllMedicines({int? page}) async {
    var response = await _medicineApi.getAllMedicines(page: page);
    return response;
  }
}
