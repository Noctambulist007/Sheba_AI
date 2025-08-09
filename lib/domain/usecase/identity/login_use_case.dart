import 'package:sheba_ai/domain/model/identity/token_data.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class LoginUseCase {
  final IdentityRepository _identityRepository;

  LoginUseCase({required IdentityRepository identityRepository})
    : _identityRepository = identityRepository;

  Future<Result<TokenData?>> call({
    required String username,
    required String password,
  }) async {
    return await _identityRepository
        .login(username: username, password: password)
        .then((tokenData) => Result.success(tokenData))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
