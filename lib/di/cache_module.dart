import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpCacheModule() async {
  // SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
}
