import 'package:sheba_ai/data/datasource/remote/model/request/identity/login_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/profile_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/register_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';
import 'package:sheba_ai/domain/model/identity/lives.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';

abstract class IdentityApi {
  Future<LoginResponse> login(LoginRequest requestBody);

  Future<RegisterResponse> register(RegisterRequest requestBody);

  Future<LoginResponse> refreshToken(String refreshToken);

  Future<Profile> getProfile();

  Future<Profile> updateProfile(ProfileRequest profile);

  Future<Lives> getLives();

  Future<Map<String, dynamic>> verifyEmail(String email);
}
