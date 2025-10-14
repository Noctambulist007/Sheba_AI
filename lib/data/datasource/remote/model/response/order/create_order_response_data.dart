import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_response_data.freezed.dart';
part 'create_order_response_data.g.dart';

@freezed
abstract class CreateOrderResponseData with _$CreateOrderResponseData {
  const factory CreateOrderResponseData({
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'shipping_address') required String shippingAddress,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'notes') String? notes,
  }) = _CreateOrderResponseData;

  factory CreateOrderResponseData.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseDataFromJson(json);
}
