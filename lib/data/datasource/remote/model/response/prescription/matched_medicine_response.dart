import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/dosage_form_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/generic_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/manufacturer_response_data.dart';

part 'matched_medicine_response.freezed.dart';
part 'matched_medicine_response.g.dart';

@freezed
abstract class MatchedMedicineResponse with _$MatchedMedicineResponse {
  const factory MatchedMedicineResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'generic_name') required String genericName,
    @JsonKey(name: 'price') required String price,
  }) = _MatchedMedicineResponse;

  factory MatchedMedicineResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchedMedicineResponseFromJson(json);
}
