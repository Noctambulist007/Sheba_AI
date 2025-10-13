import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/order/order_list_data.dart';

part 'order_list_response.freezed.dart';
part 'order_list_response.g.dart';

@freezed
abstract class OrderListResponse with _$OrderListResponse {
  const factory OrderListResponse({
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'data') required OrderListData data,
  }) = _OrderListResponse;

  factory OrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderListResponseFromJson(json);
}
