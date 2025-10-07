import 'package:sheba_ai/domain/model/identity/profile.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class GetProfileUseCase {
  final IdentityRepository _identityRepository;

  GetProfileUseCase({required IdentityRepository identityRepository})
    : _identityRepository = identityRepository;

  Future<Result<Profile>> call() async {
    return _identityRepository
        .getProfile()
        .then((profile) => Result.success(profile))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
