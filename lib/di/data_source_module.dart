import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpDataSourceModule() async {
  await setUpLocalDataSourceModule();
  await setUpRemoteDataSourceModule();
}

Future<void> setUpLocalDataSourceModule() async {
  await getIt.isReady<SharedPreferences>();
}

Future<void> setUpRemoteDataSourceModule() async {}
