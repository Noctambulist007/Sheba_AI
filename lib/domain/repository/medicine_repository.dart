import 'package:sheba_ai/domain/model/medicine/medicine.dart';

abstract class MedicineRepository {
  Future<List<Medicine>> getAllMedicines({int? page, String? search});
}
