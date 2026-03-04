import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class VerifyEmailUseCase {
  final IdentityRepository _identityRepository;

  VerifyEmailUseCase({required IdentityRepository identityRepository})
    : _identityRepository = identityRepository;

  Future<Result<bool>> call(String email) async {
    return await _identityRepository
        .isEmailVerified(email)
        .then((isVerified) => Result.success(isVerified))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
