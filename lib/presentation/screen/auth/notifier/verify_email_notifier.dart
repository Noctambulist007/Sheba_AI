import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/usecase/identity/verify_email_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/auth/state/verify_email_ui_state.dart';

class VerifyEmailNotifier extends StateNotifier<VerifyEmailUiState> {
  VerifyEmailNotifier() : super(const VerifyEmailUiState.initial());

  Future<void> checkVerification(String email) async {
    state = const VerifyEmailUiState.loading();

    final useCase = getIt<VerifyEmailUseCase>();
    final result = await useCase(email);

    state = result.when(
      success: (isVerified) {
        if (isVerified) {
          return const VerifyEmailUiState.verified();
        } else {
          return const VerifyEmailUiState.unverified();
        }
      },
      failure: (failure) => VerifyEmailUiState.error(failure.message),
    );
  }

  void reset() {
    state = const VerifyEmailUiState.initial();
  }

  void setUnverified() {
    state = const VerifyEmailUiState.unverified();
  }
}
