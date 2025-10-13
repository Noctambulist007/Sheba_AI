import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_ui_state.freezed.dart';

@freezed
class MedicineUiState with _$MedicineUiState {
  const factory MedicineUiState.initial() = InitialState;

  const factory MedicineUiState.loading() = LoadingState;

  const factory MedicineUiState.success({required List<Medicine> medicine}) =
      SuccessState;

  const factory MedicineUiState.error(String message) = ErrorState;
}
