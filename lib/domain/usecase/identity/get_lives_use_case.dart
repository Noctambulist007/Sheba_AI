import 'package:sheba_ai/domain/model/identity/lives.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class GetLivesUseCase {
  final IdentityRepository _identityRepository;

  GetLivesUseCase({required IdentityRepository identityRepository})
    : _identityRepository = identityRepository;

  Future<Result<Lives>> call() async {
    return _identityRepository
        .getLives()
        .then((lives) => Result.success(lives))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
