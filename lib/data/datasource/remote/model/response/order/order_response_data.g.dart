// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderResponseData _$OrderResponseDataFromJson(Map<String, dynamic> json) =>
    _OrderResponseData(
      id: (json['id'] as num).toInt(),
      orderNumber: json['order_number'] as String,
      status: json['status'] as String,
      statusDisplay: json['status_display'] as String,
      totalPrice: json['total_price'] as String,
      paymentMethod: json['payment_method'] as String,
      paymentMethodDisplay: json['payment_method_display'] as String,
      paymentStatus: json['payment_status'] as bool,
      itemCount: (json['item_count'] as num).toInt(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$OrderResponseDataToJson(_OrderResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'status_display': instance.statusDisplay,
      'total_price': instance.totalPrice,
      'payment_method': instance.paymentMethod,
      'payment_method_display': instance.paymentMethodDisplay,
      'payment_status': instance.paymentStatus,
      'item_count': instance.itemCount,
      'created_at': instance.createdAt,
    };
