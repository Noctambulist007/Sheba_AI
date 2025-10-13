// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemRequest _$OrderItemRequestFromJson(Map<String, dynamic> json) =>
    _OrderItemRequest(
      medicineId: (json['medicine_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$OrderItemRequestToJson(_OrderItemRequest instance) =>
    <String, dynamic>{
      'medicine_id': instance.medicineId,
      'quantity': instance.quantity,
    };
