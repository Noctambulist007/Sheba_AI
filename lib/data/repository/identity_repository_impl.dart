import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/profile_response.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';
import 'package:sheba_ai/data/mapper/identity/token_response_mapper.dart';
import 'package:sheba_ai/data/repository/source/local/identity_local_data_source.dart';
import 'package:sheba_ai/data/repository/source/remote/identity_remote_data_source.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';
import 'package:sheba_ai/domain/model/identity/token_data.dart';
import 'package:sheba_ai/domain/model/identity/user.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';

class IdentityRepositoryImpl implements IdentityRepository {
  final IdentityRemoteDataSource identityRemoteDataSource;
  final IdentityLocalDataSource identityLocalDataSource;

  IdentityRepositoryImpl({
    required this.identityRemoteDataSource,
    required this.identityLocalDataSource,
  });

  @override
  Future<TokenData?> getToken() async {
    try {
      var accessToken = identityLocalDataSource.getAccessToken();

      debugPrint("Access token = $accessToken");

      if (accessToken.isEmpty) {
        return null;
      }

      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
      debugPrint("Decoded token: $decodedToken");

      if (!JwtDecoder.isExpired(accessToken)) {
        debugPrint("Access token is valid. Returning decoded token data.");
        return decodedToken.toTokenData();
      }

      debugPrint("Access token expired. Attempting to refresh...");
      await identityLocalDataSource.clearAccessToken();

      final refreshToken = identityLocalDataSource.getRefreshToken();
      if (refreshToken.isEmpty) {
        debugPrint("Refresh token is empty. Returning null.");
        return null;
      }

      final response = await identityRemoteDataSource.refreshToken(
        refreshToken,
      );
      await identityLocalDataSource.saveAccessToken(response.accessToken);
      await identityLocalDataSource.saveRefreshToken(response.refreshToken);

      decodedToken = JwtDecoder.decode(response.accessToken);
      debugPrint("New access token decoded: $decodedToken");
      return decodedToken.toTokenData();
    } catch (error, stackTrace) {
      debugPrint("Error occurred while refreshing token: $error");
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }

  @override
  Future<TokenData?> login({
    required String username,
    required String password,
  }) async {
    //
    var response = await identityRemoteDataSource.login(
      username: username,
      password: password,
    );

    identityLocalDataSource.saveAccessToken(response.accessToken);
    identityLocalDataSource.saveRefreshToken(response.refreshToken);

    Map<String, dynamic> decodedToken = JwtDecoder.decode(response.accessToken);
    debugPrint(decodedToken.toString());

    return Future.value(decodedToken.toTokenData());
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
    var response = await identityRemoteDataSource.register(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address: address,
      username: username,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    return response;
  }

  @override
  Future<Profile> getProfile() async {
    var profile = await identityRemoteDataSource.getProfile();
    identityLocalDataSource.setAccountId(id: profile.id.toString());
    return profile;
  }
}
