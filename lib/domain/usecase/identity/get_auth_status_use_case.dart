import 'package:sheba_ai/domain/model/identity/token_data.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class GetAuthStatusUseCase {
  final IdentityRepository _identityRepository;

  GetAuthStatusUseCase({required IdentityRepository identityRepository})
    : _identityRepository = identityRepository;

  Future<Result<TokenData?>> call() async {
    return await _identityRepository
        .getToken()
        .then((tokenData) => Result.success(tokenData))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
