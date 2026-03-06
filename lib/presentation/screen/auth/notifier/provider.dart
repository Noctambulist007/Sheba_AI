import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/auth_notifier.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/login_notifier.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/register_notifier.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/verify_email_notifier.dart';
import 'package:sheba_ai/presentation/screen/auth/state/auth_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/state/login_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/state/register_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/state/verify_email_ui_state.dart';

typedef AuthNotifierProvider
= StateNotifierProvider<AuthNotifier, AuthUiState>;

final AuthNotifierProvider authNotifierProvider =
StateNotifierProvider((ref) => AuthNotifier());

typedef LoginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginUiState>;

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginUiState>((ref) {
      return LoginNotifier(ref);
    });

typedef RegisterNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterUiState>;

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterUiState>((ref) {
      return RegisterNotifier(ref);
    });

typedef VerifyEmailNotifierProvider =
    StateNotifierProvider<VerifyEmailNotifier, VerifyEmailUiState>;

final verifyEmailNotifierProvider =
    StateNotifierProvider<VerifyEmailNotifier, VerifyEmailUiState>((ref) {
      return VerifyEmailNotifier();
    });
