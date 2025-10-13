import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheba_ai/data/datasource/local/source/core_local_data_source_impl.dart';
import 'package:sheba_ai/data/datasource/local/source/identity_local_data_source_impl.dart';
import 'package:sheba_ai/data/datasource/remote/source/identity_remote_data_source_impl.dart';
import 'package:sheba_ai/data/datasource/remote/source/medicine_remote_data_source_impl.dart';
import 'package:sheba_ai/data/datasource/remote/source/order_remote_data_source_impl.dart';
import 'package:sheba_ai/data/repository/source/local/core_local_data_source.dart';
import 'package:sheba_ai/data/repository/source/local/identity_local_data_source.dart';
import 'package:sheba_ai/data/repository/source/remote/identity_remote_data_source.dart';
import 'package:sheba_ai/data/repository/source/remote/medicine_remote_data_source.dart';
import 'package:sheba_ai/data/repository/source/remote/order_remote_data_source.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpDataSourceModule() async {
  await setUpLocalDataSourceModule();
  await setUpRemoteDataSourceModule();
}

Future<void> setUpLocalDataSourceModule() async {
  await getIt.isReady<SharedPreferences>();

  getIt.registerLazySingleton<CoreLocalDataSource>(
        () => CoreLocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<IdentityLocalDataSource>(
        () => IdentityLocalDataSourceImpl(sharedPref: getIt()),
  );

}

Future<void> setUpRemoteDataSourceModule() async {

  getIt.registerLazySingleton<IdentityRemoteDataSource>(
        () => IdentityRemoteDataSourceImpl(identityApi: getIt()),
  );

  getIt.registerLazySingleton<MedicineRemoteDataSource>(
        () => MedicineRemoteDataSourceImpl(medicineApi: getIt()),
  );

  getIt.registerLazySingleton<OrderRemoteDataSource>(
        () => OrderRemoteDataSourceImpl(orderApi: getIt()),
  );
}
