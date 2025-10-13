// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) =>
    _CreateOrderResponse(
      shippingAddress: json['shipping_address'] as String,
      phoneNumber: json['phone_number'] as String,
      paymentMethod: json['payment_method'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CreateOrderResponseToJson(
  _CreateOrderResponse instance,
) => <String, dynamic>{
  'shipping_address': instance.shippingAddress,
  'phone_number': instance.phoneNumber,
  'payment_method': instance.paymentMethod,
  'notes': instance.notes,
};
