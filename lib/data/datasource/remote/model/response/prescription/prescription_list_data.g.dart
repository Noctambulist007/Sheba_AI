// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrescriptionListData _$PrescriptionListDataFromJson(
  Map<String, dynamic> json,
) => _PrescriptionListData(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => PrescriptionResponseData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PrescriptionListDataToJson(
  _PrescriptionListData instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
