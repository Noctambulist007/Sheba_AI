import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/prescription/prescription_list_data.dart';

part 'prescription_list_response.freezed.dart';
part 'prescription_list_response.g.dart';

@freezed
abstract class PrescriptionListResponse with _$PrescriptionListResponse{
  const factory PrescriptionListResponse({
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'data') required PrescriptionListData data,
  }) = _PrescriptionListResponse;

  factory PrescriptionListResponse.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionListResponseFromJson(json);
}
