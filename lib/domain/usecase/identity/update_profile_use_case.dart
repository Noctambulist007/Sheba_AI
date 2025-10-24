import 'package:sheba_ai/data/datasource/remote/model/request/identity/profile_request.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class UpdateProfileUseCase {
  final IdentityRepository _identityRepository;

  UpdateProfileUseCase({required IdentityRepository identityRepository})
    : _identityRepository = identityRepository;

  Future<Result<Profile>> call(
      ProfileRequest profile
      ) async {
    return _identityRepository
        .updateProfile(profile)
        .then((profile) => Result.success(profile))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
