import 'package:get_it/get_it.dart';
import 'package:sheba_ai/service/notification_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpServiceModule() async {
  // getIt.registerLazySingleton<SnackBarService>(() => SnackBarService());
  getIt.registerLazySingleton<NotificationService>(() => NotificationService());
}
