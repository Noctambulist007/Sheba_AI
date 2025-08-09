import 'package:sheba_ai/data/datasource/remote/api/identity_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/login_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';
import 'package:sheba_ai/data/repository/source/remote/identity_remote_data_source.dart';

class IdentityRemoteDataSourceImpl extends IdentityRemoteDataSource {
  final IdentityApi _identityApi;

  IdentityRemoteDataSourceImpl({required IdentityApi identityApi})
      : _identityApi = identityApi;

  @override
  Future<LoginResponse> refreshToken(String refreshToken) {
    return _identityApi.refreshToken(refreshToken);
  }

  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    var request = LoginRequest(username: username, password: password);
    return await _identityApi.login(request);
  }
}
