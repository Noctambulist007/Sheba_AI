import 'package:sheba_ai/data/datasource/remote/model/request/identity/login_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';

abstract class IdentityApi {
  Future<LoginResponse> login(LoginRequest requestBody);

  Future<LoginResponse> refreshToken(String refreshToken);
}
