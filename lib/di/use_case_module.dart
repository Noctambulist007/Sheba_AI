import 'package:sheba_ai/domain/usecase/identity/get_auth_status_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/get_lives_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/get_profile_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/login_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/register_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/update_profile_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/verify_email_use_case.dart';
import 'package:sheba_ai/domain/usecase/medicine/get_all_medicines_use_case.dart';
import 'package:sheba_ai/domain/usecase/order/create_order_use_case.dart';
import 'package:sheba_ai/domain/usecase/order/get_all_orders_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/analyze_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/create_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/delete_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/get_all_prescriptions_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/get_prescription_use_case.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpUseCaseModule() async {
  await setUpIdentityUseCaseModule();
  await setUpMedicineUseCaseModule();
  await setUpOrderUseCaseModule();
  await setUpPrescriptionUseCaseModule();
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

  getIt.registerLazySingleton(
        () => UpdateProfileUseCase(identityRepository: getIt()),
  );

  getIt.registerLazySingleton(
        () => GetLivesUseCase(identityRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => VerifyEmailUseCase(identityRepository: getIt()),
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

Future<void> setUpPrescriptionUseCaseModule() async {
  getIt.registerLazySingleton(
    () => GetAllPrescriptionsUseCase(prescriptionRepository: getIt()),
  );

  getIt.registerLazySingleton(
        () => GetPrescriptionUseCase(prescriptionRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => CreatePrescriptionUseCase(prescriptionRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => AnalyzePrescriptionUseCase(prescriptionRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => DeletePrescriptionUseCase(prescriptionRepository: getIt()),
  );
}
