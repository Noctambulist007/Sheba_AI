import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';

part 'medicine_ui_state.freezed.dart';

@freezed
class MedicineUiState with _$MedicineUiState {
  const factory MedicineUiState.initial() = InitialState;

  const factory MedicineUiState.loading() = LoadingState;

  const factory MedicineUiState.success({
    required List<Medicine> medicine,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
  }) = SuccessState;

  const factory MedicineUiState.error(String message) = ErrorState;
}
