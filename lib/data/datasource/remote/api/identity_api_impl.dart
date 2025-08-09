import 'package:flutter/foundation.dart';
import 'package:sheba_ai/data/datasource/remote/api/identity_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/login_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';
import 'package:sheba_ai/data/datasource/remote/util/api_client.dart';

class IdentityApiImpl extends IdentityApi {
  final ApiClient _client;

  static const loginUrl = 'accounts/auth/login/';
  static const registerUrl = 'accounts/auth/register/';
  static const refreshTokenUrl = 'accounts/auth/refresh/';

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
}
