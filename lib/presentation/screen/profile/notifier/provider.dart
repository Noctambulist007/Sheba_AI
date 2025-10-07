import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/profile/notifier/profile_notifier.dart';
import 'package:sheba_ai/presentation/screen/profile/state/profile_ui_state.dart';

typedef ProfileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileUiState>;

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileUiState>((ref) {
      return ProfileNotifier(ref.watch(authNotifierProvider));
    });
