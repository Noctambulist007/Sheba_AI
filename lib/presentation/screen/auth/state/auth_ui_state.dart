import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/domain/model/identity/token_data.dart';

part 'auth_ui_state.freezed.dart';

@freezed
class AuthUiState with _$AuthUiState {
  const factory AuthUiState.anonymous() = AnonymousState;

  const factory AuthUiState.loading() = LoadingState;

  const factory AuthUiState.authenticated({required TokenData tokenData}) =
  AuthenticatedState;

  const factory AuthUiState.error(String message) = ErrorState;
}
