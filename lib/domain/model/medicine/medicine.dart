import 'package:sheba_ai/domain/model/medicine/dosage_form.dart';
import 'package:sheba_ai/domain/model/medicine/generic.dart';
import 'package:sheba_ai/domain/model/medicine/manufacturer.dart';

class Medicine {
  final int medicineId;
  final String name;
  final String slug;
  final String strength;
  final Manufacturer manufacturer;
  final Generic generic;
  final DosageForm dosageForm;
  final String price;
  final String formattedPrice;
  final String unit;

  Medicine({
    required this.medicineId,
    required this.name,
    required this.slug,
    required this.strength,
    required this.manufacturer,
    required this.generic,
    required this.dosageForm,
    required this.price,
    required this.formattedPrice,
    required this.unit,
  });
}
