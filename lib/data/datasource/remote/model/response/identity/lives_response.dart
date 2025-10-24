import 'package:freezed_annotation/freezed_annotation.dart';

part 'lives_response.freezed.dart';

part 'lives_response.g.dart';

@freezed
abstract class LivesResponse with _$LivesResponse {
  const factory LivesResponse({
    @JsonKey(name: 'lives_remaining', defaultValue: 0) required int livesRemaining,
    @JsonKey(name: 'max_lives', defaultValue: 0) required int maxLives,
    @JsonKey(name: 'last_reset', defaultValue: '') required String lastReset,
    @JsonKey(name: 'next_reset', defaultValue: '') required String nextReset,
  }) = _LivesResponse;

  factory LivesResponse.fromJson(Map<String, dynamic> json) =>
      _$LivesResponseFromJson(json);
}
