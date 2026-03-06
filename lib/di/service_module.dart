import 'package:get_it/get_it.dart';
import 'package:sheba_ai/data/datasource/remote/service/notification_service.dart';
import 'package:sheba_ai/data/datasource/remote/service/skin_analysis_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpServiceModule() async {
  // getIt.registerLazySingleton<SnackBarService>(() => SnackBarService());
  getIt.registerLazySingleton<NotificationService>(() => NotificationService());
  getIt.registerLazySingleton<SkinAnalysisService>(() => SkinAnalysisService());
}
