import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheba_ai/data/repository/source/local/identity_local_data_source.dart';

class IdentityLocalDataSourceImpl extends IdentityLocalDataSource {
  final SharedPreferences _sharedPref;

  static const _accessToken = 'access';
  static const _refreshToken = 'refresh';

  IdentityLocalDataSourceImpl({required SharedPreferences sharedPref})
    : _sharedPref = sharedPref;

  @override
  String getAccessToken() => _sharedPref.getString(_accessToken) ?? '';

  @override
  Future<void> saveAccessToken(String token) async =>
      _sharedPref.setString(_accessToken, token);

  @override
  String getRefreshToken() => _sharedPref.getString(_refreshToken) ?? '';

  @override
  Future<void> saveRefreshToken(String token) async =>
      _sharedPref.setString(_refreshToken, token);

  @override
  Future<void> clearTokens() async {
    await _sharedPref.remove(_accessToken);
    await _sharedPref.remove(_refreshToken);
  }

  @override
  Future<void> setToken({required String token}) async {
    _sharedPref.setString(_accessToken, token);
  }

  @override
  String? getAccountId() {
    print('Getting account ID ${_sharedPref.getString('account_id')}');
    return _sharedPref.getString('account_id');
  }

  @override
  Future<void> setAccountId({required String id}) async {
    print('Setting account ID: $id');
    await _sharedPref.setString('account_id', id);
  }

  @override
  Future<void> clearAccessToken() async {
    await _sharedPref.remove(_accessToken);
  }
}
