import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/login_response.dart';
import 'package:sheba_ai/data/repository/source/local/core_local_data_source.dart';
import 'package:sheba_ai/data/repository/source/local/identity_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  final IdentityLocalDataSource _identityLocalDataSource;
  final CoreLocalDataSource _coreLocalDataSource;

  AuthInterceptor({
    required IdentityLocalDataSource identityLocalDataSource,
    required CoreLocalDataSource coreLocalDataSource,
  })  : _identityLocalDataSource = identityLocalDataSource,
        _coreLocalDataSource = coreLocalDataSource;

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    List<MapEntry<String, String>> requestHeaders = [];

    final platform = _coreLocalDataSource.getPlatform();
    final os = _coreLocalDataSource.getOperatingSystem();
    final localeName = _coreLocalDataSource.getLocaleName();
    final packageName = await _coreLocalDataSource.getPackageName();
    final versionName = await _coreLocalDataSource.getApkVersion();
    final timeZone = _coreLocalDataSource.getTimeZone();

    requestHeaders += [
      MapEntry('App-Platform', platform),
      MapEntry('App-Os', os),
      MapEntry('App-Locale', localeName),
      MapEntry('App-Package-Name', packageName),
      const MapEntry("Cross-Origin-Opener-Policy", "same-origin allow-popups"),
      MapEntry('App-Version', versionName),
      MapEntry('Time-Zone', timeZone),
    ];

    final token = _identityLocalDataSource.getAccessToken();

    if (token.isNotEmpty) {
      requestHeaders.add(MapEntry('Authorization', 'Bearer $token'));
    }

    options.headers.addEntries(requestHeaders);
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint("status code = ${err.response?.statusCode}");
    debugPrint("error response data = ${err.response?.data}");

    if (err.response?.statusCode == 401) {
      final refreshToken = _identityLocalDataSource.getRefreshToken();

      debugPrint("_xyz: refresh token is $refreshToken");
      if(refreshToken.isEmpty) {
        debugPrint("_xyz: refresh token is empty, returning error");
        return handler.next(err);
      }

      try {
        final dio = Dio();

        const url = 'https://shebaai.pythonanywhere.com/api/accounts/auth/refresh/';

        final apiResponse = await dio.post(
          url,
          data: {'refresh': refreshToken},
        );

        debugPrint("Refresh token response: ${apiResponse.data}");

        if (apiResponse.statusCode == 200) {
          final response = LoginResponse.fromJson(apiResponse.data);
          var accessToken = response.accessToken;

          if (accessToken.isNotEmpty) {
            debugPrint("New access token received: $accessToken");
            await _identityLocalDataSource.saveAccessToken(accessToken);

            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer $accessToken';

            final response = await Dio().fetch(options);
            return handler.resolve(response);
          } else {
            debugPrint("Received empty access token from refresh response");
          }
        } else {
          debugPrint("Refresh token request failed with status: ${apiResponse.statusCode}");
        }
      } catch (e) {
        debugPrint("Error during token refresh: $e");
      }
    }
    return handler.next(err);
  }
}
