import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/usecase/identity/get_lives_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/auth/state/auth_ui_state.dart';
import 'package:sheba_ai/presentation/screen/lives/state/lives_ui_state.dart';

class LivesNotifier extends StateNotifier<LivesUiState> {
  final AuthUiState _authUiState;

  LivesNotifier({required AuthUiState authUiState})
    : _authUiState = authUiState,
      super(const LivesUiState.initial()) {
    _authUiState.maybeWhen(
      orElse: () => null,
      authenticated: (profile) {
        fetchMyLives();
      },
    );
  }

  void fetchMyLives() async {
    state = const LivesUiState.loading();

    final useCase = getIt<GetLivesUseCase>();
    final result = await useCase();

    state = result.when(
      success: (lives) => LivesUiState.success(lives),
      failure: (failure) => LivesUiState.error(failure.message),
    );
  }
}
