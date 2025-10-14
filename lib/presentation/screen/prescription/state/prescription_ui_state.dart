import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_ai/domain/model/prescription/analyze_prescription.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';

part 'prescription_ui_state.freezed.dart';

@freezed
class PrescriptionUiState with _$PrescriptionUiState {
  const factory PrescriptionUiState.initial() = InitialState;

  const factory PrescriptionUiState.loading() = LoadingState;

  const factory PrescriptionUiState.success({
    required List<Prescription> prescription,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
  }) = SuccessState;

  const factory PrescriptionUiState.analyzeSuccess({
    required AnalyzePrescription analyzePrescription,
  }) = AnalyzeSuccessState;

  const factory PrescriptionUiState.error(String message) = ErrorState;
}
