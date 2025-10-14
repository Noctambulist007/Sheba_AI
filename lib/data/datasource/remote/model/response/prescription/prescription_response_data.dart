import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/dosage_form_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/generic_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/manufacturer_response_data.dart';

part 'prescription_response_data.freezed.dart';
part 'prescription_response_data.g.dart';

@freezed
abstract class PrescriptionResponseData with _$PrescriptionResponseData {
  const factory PrescriptionResponseData({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _PrescriptionResponseData;

  factory PrescriptionResponseData.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionResponseDataFromJson(json);
}
