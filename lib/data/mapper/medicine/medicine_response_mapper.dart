import 'package:sheba_ai/data/datasource/remote/model/response/medicine/medicine_response_data.dart';
import 'package:sheba_ai/data/mapper/medicine/dosage_form_response_mapper.dart';
import 'package:sheba_ai/data/mapper/medicine/generic_response_mapper.dart';
import 'package:sheba_ai/data/mapper/medicine/manufacturer_response_mapper.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';

extension MedicineResponseMapper on MedicineResponseData {
  Medicine toMedicine() {
    return Medicine(
      medicineId: medicineId,
      name: name,
      slug: slug,
      strength: strength,
      manufacturer: manufacturer.toManufacturer(),
      generic: generic.toGeneric(),
      dosageForm: dosageForm.toDosageForm(),
      price: price,
      formattedPrice: formattedPrice,
      unit: unit,
    );
  }
}
