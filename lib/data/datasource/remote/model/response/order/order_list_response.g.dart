// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderListResponse _$OrderListResponseFromJson(Map<String, dynamic> json) =>
    _OrderListResponse(
      success: json['success'] as bool,
      data: OrderListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderListResponseToJson(_OrderListResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
