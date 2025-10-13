import 'package:sheba_ai/domain/model/medicine/medicine.dart';

abstract class MedicineRemoteDataSource {
  Future<List<Medicine>> getAllMedicines({int? page});
}
