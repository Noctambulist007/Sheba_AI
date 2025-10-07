import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
