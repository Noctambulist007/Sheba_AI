import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/order/order_item_request.dart';

part 'create_order_request.freezed.dart';

part 'create_order_request.g.dart';

@freezed
abstract class CreateOrderRequest with _$CreateOrderRequest {
  const factory CreateOrderRequest({
    @JsonKey(name: 'shipping_address') required String shippingAddress,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'items') required List<OrderItemRequest> items,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
}
