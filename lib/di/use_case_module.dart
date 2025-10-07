import 'package:sheba_ai/domain/usecase/identity/get_auth_status_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/get_profile_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/login_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/register_use_case.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpUseCaseModule() async {
  await setUpIdentityUseCaseModule();
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
