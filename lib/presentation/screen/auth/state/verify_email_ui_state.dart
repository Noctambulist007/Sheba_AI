import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_ui_state.freezed.dart';

@freezed
class VerifyEmailUiState with _$VerifyEmailUiState {
  const factory VerifyEmailUiState.initial() = VerifyEmailInitialState;

  const factory VerifyEmailUiState.loading() = VerifyEmailLoadingState;

  const factory VerifyEmailUiState.verified() = VerifyEmailVerifiedState;

  const factory VerifyEmailUiState.unverified() = VerifyEmailUnverifiedState;

  const factory VerifyEmailUiState.error(String message) =
      VerifyEmailErrorState;
}
