import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/data/repository/source/local/identity_local_data_source.dart';
import 'package:sheba_ai/domain/model/identity/token_data.dart';
import 'package:sheba_ai/domain/usecase/identity/get_auth_status_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/auth/state/auth_ui_state.dart';

class AuthNotifier extends StateNotifier<AuthUiState> {
  AuthNotifier() : super(const AuthUiState.loading()) {
    _initAuthState();
  }

  Future<void> _initAuthState() async {
    final useCase = getIt<GetAuthStatusUseCase>();
    final result = await useCase();

    result.when(
      success: (tokenData) {
        if (tokenData != null) {
          state = AuthUiState.authenticated(tokenData: tokenData);
        } else {
          state = const AuthUiState.anonymous();
        }
      },
      failure: (failure) {
        state = const AuthUiState.anonymous();
        debugPrint('Auth check failed: ${failure.message}');
      },
    );
  }

  void updateAuthState(TokenData tokenData) {
    state = AuthUiState.authenticated(tokenData: tokenData);
  }

  void clearAuthState() {
    state = const AuthUiState.anonymous();
  }

  Future<void> logout() async {
    final identityLocalDataSource = getIt<IdentityLocalDataSource>();
    await identityLocalDataSource.clearTokens();
    state = const AuthUiState.anonymous();
  }
}
