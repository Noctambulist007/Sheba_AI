import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_response.freezed.dart';
part 'create_order_response.g.dart';

@freezed
abstract class CreateOrderResponse with _$CreateOrderResponse {
  const factory CreateOrderResponse({
    @JsonKey(name: 'shipping_address') required String shippingAddress,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'notes') String? notes,
  }) = _CreateOrderResponse;

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);
}
