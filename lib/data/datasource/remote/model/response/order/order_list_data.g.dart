// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderListData _$OrderListDataFromJson(Map<String, dynamic> json) =>
    _OrderListData(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => OrderResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderListDataToJson(_OrderListData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
