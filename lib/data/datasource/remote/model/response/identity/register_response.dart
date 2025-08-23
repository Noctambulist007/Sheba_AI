import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';

part 'register_response.g.dart';

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    @JsonKey(name: 'username', defaultValue: '') required String username,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'first_name', defaultValue: '') required String firstName,
    @JsonKey(name: 'last_name', defaultValue: '') required String lastName,
    @JsonKey(name: 'phone', defaultValue: '') required String phone,
    @JsonKey(name: 'address', defaultValue: '') required String address,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
