import 'package:sheba_ai/domain/model/medicine/medicine.dart';

abstract class MedicineApi {
  Future<List<Medicine>> getAllMedicines({int? page, String? search});
}
