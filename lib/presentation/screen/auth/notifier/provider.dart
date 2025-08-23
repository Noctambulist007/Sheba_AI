// Provider for LoginNotifier
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/login_notifier.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/register_notifier.dart';
import 'package:sheba_ai/presentation/screen/auth/state/login_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/state/register_ui_state.dart';

typedef LoginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginUiState>;

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginUiState>((ref) {
      return LoginNotifier(ref);
    });

// Provider for RegisterNotifier
typedef RegisterNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterUiState>;

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterUiState>((ref) {
      return RegisterNotifier(ref);
    });
