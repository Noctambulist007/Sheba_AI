import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/domain/model/identity/token_data.dart';

part 'login_ui_state.freezed.dart';

@freezed
class LoginUiState with _$LoginUiState {
  const factory LoginUiState.initial() = InitialState;

  const factory LoginUiState.loading() = LoadingState;

  const factory LoginUiState.success({required TokenData tokenData}) =
      SuccessState;

  const factory LoginUiState.error(String message) = ErrorState;
}
