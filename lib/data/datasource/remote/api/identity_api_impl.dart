import 'package:flutter/foundation.dart';
import 'package:sheba_ai/data/datasource/remote/api/identity_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/login_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/profile_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/register_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/lives_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/profile_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';
import 'package:sheba_ai/data/datasource/remote/util/api_client.dart';
import 'package:sheba_ai/data/mapper/identity/lives_response_mapper.dart';
import 'package:sheba_ai/data/mapper/identity/profile_response_mapper.dart';
import 'package:sheba_ai/domain/model/identity/lives.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';

class IdentityApiImpl extends IdentityApi {
  final ApiClient _client;

  static const loginUrl = 'accounts/auth/login/';
  static const registerUrl = 'accounts/auth/register/';
  static const refreshTokenUrl = 'accounts/auth/refresh/';
  static const profileUrl = 'accounts/auth/profile/';
  static const livesUrl = 'accounts/user/lives/';

  IdentityApiImpl({required ApiClient client}) : _client = client;

  @override
  Future<LoginResponse> refreshToken(String refreshToken) {
    return _client.post<JSONObject, LoginResponse>(
      path: refreshTokenUrl,
      data: {'refresh': refreshToken},
      converter: (json) => LoginResponse.fromJson(json),
    );
  }

  @override
  Future<LoginResponse> login(LoginRequest requestBody) async {
    try {
      debugPrint("Login request: ${requestBody.toJson()}");
      final response = await _client.post<JSONObject, LoginResponse>(
        path: loginUrl,
        data: requestBody.toJson(),
        converter: (json) {
          debugPrint("Login response: $json");
          return LoginResponse.fromJson(json);
        },
      );
      return response;
    } catch (e) {
      debugPrint("Login error: $e");
      rethrow;
    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest requestBody) async {
    try {
      debugPrint("Register request: ${requestBody.toJson()}");
      final response = await _client.post<JSONObject, RegisterResponse>(
        path: registerUrl,
        data: requestBody.toJson(),
        converter: (json) {
          debugPrint("Register response: $json");
          return RegisterResponse.fromJson(json);
        },
      );
      debugPrint("Register response: ${response.toJson()}");
      return response;
    } catch (e) {
      debugPrint("Register error: $e");
      rethrow;
    }
  }

  @override
  Future<Profile> getProfile() async {
    final response = await _client.get<JSONObject, ProfileResponse>(
      path: profileUrl,
      converter: (json) => ProfileResponse.fromJson(json),
    );
    return response.toProfile();
  }

  @override
  Future<Profile> updateProfile(ProfileRequest profile) async {
    final response = await _client.patch<JSONObject, ProfileResponse>(
      path: profileUrl,
      data: profile.toJson(),
      converter: (json) => ProfileResponse.fromJson(json),
    );
    return response.toProfile();
  }

  @override
  Future<Lives> getLives() async {
    final response = await _client.get<JSONObject, LivesResponse>(
      path: livesUrl,
      converter: (json) => LivesResponse.fromJson(json),
    );
    return response.toLives();
  }
}
