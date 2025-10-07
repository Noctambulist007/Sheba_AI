import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';

part 'profile_ui_state.freezed.dart';

@freezed
class ProfileUiState with _$ProfileUiState {
  const factory ProfileUiState.anonymous() = AnonymousState;

  const factory ProfileUiState.loading() = LoadingState;

  const factory ProfileUiState.success(Profile profile) = SuccessState;

  const factory ProfileUiState.error(String message) = ErrorState;
}
