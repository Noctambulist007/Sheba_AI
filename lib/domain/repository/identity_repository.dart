import 'package:sheba_ai/data/datasource/remote/model/request/identity/profile_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/profile_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';
import 'package:sheba_ai/domain/model/identity/lives.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';
import 'package:sheba_ai/domain/model/identity/token_data.dart';
import 'package:sheba_ai/domain/model/identity/user.dart';

abstract class IdentityRepository {
  Future<TokenData?> getToken();

  Future<TokenData?> login({
    required String username,
    required String password,
  });

  Future<RegisterResponse> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<Profile> getProfile();

  Future<Profile> updateProfile(ProfileRequest profile);

  Future<Lives> getLives();

  Future<bool> isEmailVerified(String email);
}
