import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/medicine_list_data.dart';

part 'medicine_list_response.freezed.dart';
part 'medicine_list_response.g.dart';

@freezed
abstract class MedicineListResponse with _$MedicineListResponse {
  const factory MedicineListResponse({
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'data') required MedicineListData data,
  }) = _MedicineListResponse;

  factory MedicineListResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicineListResponseFromJson(json);
}
