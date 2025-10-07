import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/usecase/identity/get_profile_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/auth/state/auth_ui_state.dart';
import 'package:sheba_ai/presentation/screen/profile/state/profile_ui_state.dart';

class ProfileNotifier extends StateNotifier<ProfileUiState> {
  final AuthUiState authState;

  ProfileNotifier(this.authState) : super(const ProfileUiState.anonymous()) {
    authState.maybeWhen(
      authenticated: (tokenData) => fetchProfile(),
      orElse: () {
        state = const ProfileUiState.anonymous();
      },
    );
  }

  void fetchProfile() async {
    if (authState is! AuthenticatedState) return;

    state = const ProfileUiState.loading();

    final useCase = getIt<GetProfileUseCase>();
    final result = await useCase();

    state = result.when(
      success: (profile) => ProfileUiState.success(profile),
      failure: (failure) => ProfileUiState.error(failure.message),
    );
  }
}
