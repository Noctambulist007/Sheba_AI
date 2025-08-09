abstract class IdentityLocalDataSource {
  String getAccessToken();

  String getRefreshToken();

  Future<void> saveAccessToken(String token);

  Future<void> saveRefreshToken(String token);

  Future<void> clearTokens();

  Future<void> clearAccessToken();

  Future<void> setToken({required String token});

  String? getAccountId();

  Future<void> setAccountId({required String id});

}
