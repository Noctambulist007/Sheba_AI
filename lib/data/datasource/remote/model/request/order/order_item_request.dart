import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_request.freezed.dart';
part 'order_item_request.g.dart';

@freezed
abstract class OrderItemRequest with _$OrderItemRequest {
  const factory OrderItemRequest({
    @JsonKey(name: 'medicine_id') required int medicineId,
    @JsonKey(name: 'quantity') required int quantity,
  }) = _OrderItemRequest;

  factory OrderItemRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderItemRequestFromJson(json);
}
