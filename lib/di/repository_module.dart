import 'package:sheba_ai/data/repository/identity_repository_impl.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/injection.dart';

Future<void> setUpRepositoryModule() async {
  getIt.registerLazySingleton<IdentityRepository>(
    () => IdentityRepositoryImpl(
      identityRemoteDataSource: getIt(),
      identityLocalDataSource: getIt(),
    ),
  );
}
