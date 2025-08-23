import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';
import 'package:sheba_ai/domain/model/identity/token_data.dart';
import 'package:sheba_ai/domain/model/identity/user.dart';
import 'package:sheba_ai/domain/repository/identity_repository.dart';
import 'package:sheba_ai/domain/util/failure.dart';
import 'package:sheba_ai/domain/util/result.dart';

class RegisterUseCase {
  final IdentityRepository _identityRepository;

  RegisterUseCase({required IdentityRepository identityRepository})
    : _identityRepository = identityRepository;

  Future<Result<RegisterResponse>> call({
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return await _identityRepository
        .register(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address: address,
      username: username,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    )
        .then((user) => Result.success(user))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
