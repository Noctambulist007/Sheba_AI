// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lives_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LivesResponse _$LivesResponseFromJson(Map<String, dynamic> json) =>
    _LivesResponse(
      livesRemaining: (json['lives_remaining'] as num?)?.toInt() ?? 0,
      maxLives: (json['max_lives'] as num?)?.toInt() ?? 0,
      lastReset: json['last_reset'] as String? ?? '',
      nextReset: json['next_reset'] as String? ?? '',
    );

Map<String, dynamic> _$LivesResponseToJson(_LivesResponse instance) =>
    <String, dynamic>{
      'lives_remaining': instance.livesRemaining,
      'max_lives': instance.maxLives,
      'last_reset': instance.lastReset,
      'next_reset': instance.nextReset,
    };
