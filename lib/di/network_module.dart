import 'package:dio/dio.dart';
import 'package:sheba_ai/data/datasource/remote/api/identity_api.dart';
import 'package:sheba_ai/data/datasource/remote/api/identity_api_impl.dart';
import 'package:sheba_ai/data/datasource/remote/api/medicine_api.dart';
import 'package:sheba_ai/data/datasource/remote/api/medicine_api_impl.dart';
import 'package:sheba_ai/data/datasource/remote/api/order_api.dart';
import 'package:sheba_ai/data/datasource/remote/api/order_api_impl.dart';
import 'package:sheba_ai/data/datasource/remote/api/prescription_api.dart';
import 'package:sheba_ai/data/datasource/remote/api/prescription_api_impl.dart';
import 'package:sheba_ai/data/datasource/remote/util/api_client.dart';
import 'package:sheba_ai/data/datasource/remote/util/auth_interceptor.dart';
import 'package:sheba_ai/data/datasource/remote/util/logging_interceptor.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpNetworkModule() async {
  const int timeOut = 60;

  const baseUrl = 'http://shebaai.kernostudio.com/api/';

  // Interceptor
  getIt.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(
      identityLocalDataSource: getIt(),
      coreLocalDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());

  // Client
  getIt.registerLazySingleton<Dio>(
    () =>
        Dio(
            BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: timeOut),
              receiveTimeout: const Duration(seconds: timeOut),
            ),
          )
          ..interceptors.addAll([
            getIt<AuthInterceptor>(),
            getIt<LoggingInterceptor>(),
          ]),
  );

  // ApiClient
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(client: getIt()));

  // Api
  getIt.registerLazySingleton<IdentityApi>(
    () => IdentityApiImpl(client: getIt()),
  );

  getIt.registerLazySingleton<MedicineApi>(
        () => MedicineApiImpl(client: getIt()),
  );

  getIt.registerLazySingleton<OrderApi>(
        () => OrderApiImpl(client: getIt()),
  );

  getIt.registerLazySingleton<PrescriptionApi>(
        () => PrescriptionApiImpl(client: getIt()),
  );
}
