import 'package:get_it/get_it.dart';
import 'package:sheba_ai/di/cache_module.dart';
import 'package:sheba_ai/di/data_source_module.dart';

import 'package:sheba_ai/di/network_module.dart';
import 'package:sheba_ai/di/repository_module.dart';
import 'package:sheba_ai/di/service_module.dart';
import 'package:sheba_ai/di/use_case_module.dart';
import 'package:sheba_ai/data/datasource/remote/service/notification_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  await setUpCacheModule();
  await getIt.allReady();
  await setUpNetworkModule();
  await setUpDataSourceModule();
  await setUpRepositoryModule();
  await setUpUseCaseModule();
  await setUpServiceModule();
  await getIt<NotificationService>().initialize();
}
