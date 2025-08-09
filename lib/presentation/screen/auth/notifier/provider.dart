// Provider for LoginNotifier
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/login_notifier.dart';
import 'package:sheba_ai/presentation/screen/auth/state/login_ui_state.dart';

typedef LoginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginUiState>;

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginUiState>((ref) {
      return LoginNotifier(ref);
    });
