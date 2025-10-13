import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/dosage_form_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/generic_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/manufacturer_response_data.dart';

part 'medicine_response_data.freezed.dart';

part 'medicine_response_data.g.dart';

@freezed
abstract class MedicineResponseData with _$MedicineResponseData {
  const factory MedicineResponseData({
    @JsonKey(name: 'medicine_id') required int medicineId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'strength') required String strength,
    @JsonKey(name: 'manufacturer') required ManufacturerResponseData manufacturer,
    @JsonKey(name: 'generic') required GenericResponseData generic,
    @JsonKey(name: 'dosage_form') required DosageFormResponseData dosageForm,
    @JsonKey(name: 'price') String? price,
    @JsonKey(name: 'formatted_price') String? formattedPrice,
    @JsonKey(name: 'unit') required String unit,
  }) = _MedicineResponseData;

  factory MedicineResponseData.fromJson(Map<String, dynamic> json) =>
      _$MedicineResponseDataFromJson(json);
}
