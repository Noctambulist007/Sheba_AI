// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderResponseData _$CreateOrderResponseDataFromJson(
  Map<String, dynamic> json,
) => _CreateOrderResponseData(
  orderNumber: json['order_number'] as String,
  shippingAddress: json['shipping_address'] as String,
  phoneNumber: json['phone_number'] as String,
  paymentMethod: json['payment_method'] as String,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateOrderResponseDataToJson(
  _CreateOrderResponseData instance,
) => <String, dynamic>{
  'order_number': instance.orderNumber,
  'shipping_address': instance.shippingAddress,
  'phone_number': instance.phoneNumber,
  'payment_method': instance.paymentMethod,
  'notes': instance.notes,
};
