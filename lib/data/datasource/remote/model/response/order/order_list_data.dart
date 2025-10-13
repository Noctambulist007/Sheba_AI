import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/order/order_response_data.dart';

part 'order_list_data.freezed.dart';
part 'order_list_data.g.dart';

@freezed
abstract class OrderListData with _$OrderListData {
  const factory OrderListData({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @JsonKey(name: 'results') required List<OrderResponseData> results,
  }) = _OrderListData;

  factory OrderListData.fromJson(Map<String, dynamic> json) =>
      _$OrderListDataFromJson(json);
}
