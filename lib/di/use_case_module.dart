import 'package:sheba_ai/domain/usecase/identity/get_auth_status_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/get_profile_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/login_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/register_use_case.dart';
import 'package:sheba_ai/domain/usecase/medicine/get_all_medicines_use_case.dart';
import 'package:sheba_ai/domain/usecase/order/create_order_use_case.dart';
import 'package:sheba_ai/domain/usecase/order/get_all_orders_use_case.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpUseCaseModule() async {
  await setUpIdentityUseCaseModule();
  await setUpMedicineUseCaseModule();
  await setUpOrderUseCaseModule();
}

Future<void> setUpIdentityUseCaseModule() async {
  getIt.registerLazySingleton(
    () => GetAuthStatusUseCase(identityRepository: getIt()),
  );

  getIt.registerLazySingleton(() => LoginUseCase(identityRepository: getIt()));

  getIt.registerLazySingleton(
    () => RegisterUseCase(identityRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => GetProfileUseCase(identityRepository: getIt()),
  );
}

Future<void> setUpMedicineUseCaseModule() async {
  getIt.registerLazySingleton(
    () => GetAllMedicinesUseCase(medicineRepository: getIt()),
  );
}

Future<void> setUpOrderUseCaseModule() async {
  getIt.registerLazySingleton(
    () => GetAllOrdersUseCase(orderRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => CreateOrderUseCase(orderRepository: getIt()),
  );
}
