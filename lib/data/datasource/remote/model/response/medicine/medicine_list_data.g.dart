// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicineListData _$MedicineListDataFromJson(Map<String, dynamic> json) =>
    _MedicineListData(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => MedicineResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicineListDataToJson(_MedicineListData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
