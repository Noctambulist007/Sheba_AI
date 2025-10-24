import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/lives/notifier/lives_notifier.dart';
import 'package:sheba_ai/presentation/screen/lives/state/lives_ui_state.dart';

typedef LivesNotifierProvider =
    StateNotifierProvider<LivesNotifier, LivesUiState>;

final LivesNotifierProvider livesNotifierProvider = StateNotifierProvider(
  (ref) => LivesNotifier(
    authUiState: ref.watch(authNotifierProvider),
  ),
);
