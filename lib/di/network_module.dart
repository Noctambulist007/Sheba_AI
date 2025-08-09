import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


Future<void> setUpNetworkModule() async {
  const int timeOut = 120 * 1000;

  const baseUrl = '';

  // // Interceptor
  // getIt.registerLazySingleton<AuthInterceptor>(
  //   () => AuthInterceptor(
  //     identityLocalDataSource: getIt(),
  //     coreLocalDataSource: getIt(),
  //   ),
  // );
  //
  // getIt.registerLazySingleton<LoggingInterceptor>(
  //   () => LoggingInterceptor(),
  // );
  //
  // // Client
  // getIt.registerLazySingleton<Dio>(
  //   () => Dio(
  //     BaseOptions(
  //       baseUrl: baseUrl,
  //       connectTimeout: const Duration(seconds: timeOut),
  //       receiveTimeout: const Duration(seconds: timeOut),
  //     ),
  //   )..interceptors.addAll([
  //       getIt<AuthInterceptor>(),
  //       getIt<LoggingInterceptor>(),
  //     ]),
  // );
  //
  // // ApiClient
  // getIt.registerLazySingleton<ApiClient>(
  //   () => ApiClient(client: getIt()),
  // );
  //
  // // Api
  // getIt.registerLazySingleton<IdentityApi>(
  //   () => IdentityApiImpl(client: getIt()),
  // );

}
