import 'package:sheba_ai/data/repository/identity_repository_impl.dart';
import 'package:sheba_ai/data/repository/medicine_repository_impl.dart';
import 'package:sheba_ai/data/repository/order_repository_impl.dart';
import 'package:sheba_ai/data/repository/prescription_repository_impl.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/domain/repository/medicine_repository.dart';
import 'package:sheba_ai/domain/repository/order_repository.dart';
import 'package:sheba_ai/domain/repository/prescription_repository.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpRepositoryModule() async {
  getIt.registerLazySingleton<IdentityRepository>(
    () => IdentityRepositoryImpl(
      identityRemoteDataSource: getIt(),
      identityLocalDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<MedicineRepository>(
    () => MedicineRepositoryImpl(medicineRemoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<OrderRepository>(
        () => OrderRepositoryImpl(orderRemoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<PrescriptionRepository>(
        () => PrescriptionRepositoryImpl(prescriptionRemoteDataSource: getIt()),
  );
}
