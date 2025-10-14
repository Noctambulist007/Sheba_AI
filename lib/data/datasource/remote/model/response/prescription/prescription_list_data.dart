import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/order/order_response_data.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/prescription/prescription_response_data.dart';

part 'prescription_list_data.freezed.dart';
part 'prescription_list_data.g.dart';

@freezed
abstract class PrescriptionListData with _$PrescriptionListData {
  const factory PrescriptionListData({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @JsonKey(name: 'results') required List<PrescriptionResponseData> results,
  }) = _PrescriptionListData;

  factory PrescriptionListData.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionListDataFromJson(json);
}
