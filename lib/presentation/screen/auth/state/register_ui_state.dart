import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/domain/model/identity/register.dart';

part 'register_ui_state.freezed.dart';

@freezed
class RegisterUiState with _$RegisterUiState {
  const factory RegisterUiState.initial() = InitialState;

  const factory RegisterUiState.loading() = LoadingState;

  const factory RegisterUiState.success({required Register register}) =
  SuccessState;

  const factory RegisterUiState.error(String message) = ErrorState;
}
