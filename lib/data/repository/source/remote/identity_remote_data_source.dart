import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';

abstract class IdentityRemoteDataSource {
  Future<LoginResponse> refreshToken(String refreshToken);

  Future<LoginResponse> login({
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
}
