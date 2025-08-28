import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/model/identity/token_data.dart';
import 'package:sheba_ai/domain/usecase/identity/login_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/auth/state/login_ui_state.dart';

class LoginNotifier extends StateNotifier<LoginUiState> {
  LoginNotifier(this.ref) : super(const LoginUiState.initial());

  final Ref ref;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const LoginUiState.loading();

    final useCase = getIt<LoginUseCase>();
    final result = await useCase(username: username, password: password);

    state = result.when(
      success: (tokenData) {
        if ((tokenData == null)) {
          return const LoginUiState.error('Token data is null');
        } //
        else {
          ref.read(authNotifierProvider.notifier).updateAuthState(tokenData);
          ref.read(loginNotifierProvider.notifier).updateAuthState(tokenData);
          return LoginUiState.success(tokenData: tokenData);
        }
      },
      failure: (failure) => LoginUiState.error(failure.message),
    );

  }

  void updateAuthState(TokenData tokenData) {
    state = LoginUiState.success(tokenData: tokenData);
  }
}
