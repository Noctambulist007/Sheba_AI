import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/dosage_form_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/generic_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/manufacturer_response_data.dart';

part 'unmatched_medicine_response.freezed.dart';
part 'unmatched_medicine_response.g.dart';

@freezed
abstract class UnmatchedMedicineResponse with _$UnmatchedMedicineResponse {
  const factory UnmatchedMedicineResponse({
    @JsonKey(name: 'name') required String name,
  }) = _UnmatchedMedicineResponse;

  factory UnmatchedMedicineResponse.fromJson(Map<String, dynamic> json) =>
      _$UnmatchedMedicineResponseFromJson(json);
}
