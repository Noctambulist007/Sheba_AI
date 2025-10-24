import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/domain/model/identity/lives.dart';

part 'lives_ui_state.freezed.dart';

@freezed
class LivesUiState with _$LivesUiState {
  const factory LivesUiState.initial() = InitialState;

  const factory LivesUiState.loading() = LoadingState;

  const factory LivesUiState.success(Lives lives) = SuccessState;

  const factory LivesUiState.error(String message) = ErrorState;
}
