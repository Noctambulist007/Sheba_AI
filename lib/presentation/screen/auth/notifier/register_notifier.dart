import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/data/datasource/remote/model/response/identity/register_response.dart';
import 'package:sheba_ai/data/mapper/identity/register_response_mapper.dart';
import 'package:sheba_ai/domain/model/identity/register.dart';
import 'package:sheba_ai/domain/model/identity/token_data.dart';
import 'package:sheba_ai/domain/usecase/identity/login_use_case.dart';
import 'package:sheba_ai/domain/usecase/identity/register_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/auth/state/login_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/state/register_ui_state.dart';

class RegisterNotifier extends StateNotifier<RegisterUiState> {
  RegisterNotifier(this.ref) : super(const RegisterUiState.initial());

  final Ref ref;

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = const RegisterUiState.loading();

    final useCase = getIt<RegisterUseCase>();
    final result = await useCase(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address: address,
      username: username,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    state = result.when(
      success: (registerResponse) {
        return RegisterUiState.success(register: registerResponse.toRegister());
            },
      failure: (failure) => RegisterUiState.error(failure.message),
    );
  }
}
