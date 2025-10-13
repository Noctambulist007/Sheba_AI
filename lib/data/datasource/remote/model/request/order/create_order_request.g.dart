// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    _CreateOrderRequest(
      shippingAddress: json['shipping_address'] as String,
      phoneNumber: json['phone_number'] as String,
      paymentMethod: json['payment_method'] as String,
      notes: json['notes'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateOrderRequestToJson(_CreateOrderRequest instance) =>
    <String, dynamic>{
      'shipping_address': instance.shippingAddress,
      'phone_number': instance.phoneNumber,
      'payment_method': instance.paymentMethod,
      'notes': instance.notes,
      'items': instance.items,
    };
