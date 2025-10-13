import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/medicine/medicine_response_data.dart';

part 'medicine_list_data.freezed.dart';
part 'medicine_list_data.g.dart';

@freezed
abstract class MedicineListData with _$MedicineListData{
  const factory MedicineListData({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @JsonKey(name: 'results') required List<MedicineResponseData> results,
  }) = _MedicineListData;

  factory MedicineListData.fromJson(Map<String, dynamic> json) =>
      _$MedicineListDataFromJson(json);
}
