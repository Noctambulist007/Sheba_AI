import 'package:sheba_ai/data/datasource/remote/api/identity_api.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/login_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/profile_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/identity/register_request.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';
import 'package:sheba_ai/data/repository/source/remote/identity_remote_data_source.dart';
import 'package:sheba_ai/domain/model/identity/lives.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';

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

  @override
  Future<RegisterResponse> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    var request = RegisterRequest(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address: address,
      username: username,
      email: email,
      password: password,
      password2: confirmPassword,
    );
    return await _identityApi.register(request);
  }

  @override
  Future<Profile> getProfile() async {
    return await _identityApi.getProfile();
  }

  @override
  Future<Profile> updateProfile(ProfileRequest profile) async {
    return await _identityApi.updateProfile(profile);
  }

  @override
  Future<Lives> getLives() async {
    return await _identityApi.getLives();
  }
}
