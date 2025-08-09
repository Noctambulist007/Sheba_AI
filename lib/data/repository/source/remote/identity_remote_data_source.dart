import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';

abstract class IdentityRemoteDataSource {
  Future<LoginResponse> refreshToken(String refreshToken);

  Future<LoginResponse> login({
    required String username,
    required String password,
  });
}
