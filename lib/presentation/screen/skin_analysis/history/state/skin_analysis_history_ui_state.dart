import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_record.dart';

sealed class SkinAnalysisHistoryUiState {
  const SkinAnalysisHistoryUiState();
}

class SkinAnalysisHistoryInitial extends SkinAnalysisHistoryUiState {
  const SkinAnalysisHistoryInitial();
}

class SkinAnalysisHistoryLoading extends SkinAnalysisHistoryUiState {
  const SkinAnalysisHistoryLoading();
}

class SkinAnalysisHistoryLoaded extends SkinAnalysisHistoryUiState {
  final List<SkinAnalysisRecord> records;
  const SkinAnalysisHistoryLoaded({required this.records});
}

class SkinAnalysisHistoryError extends SkinAnalysisHistoryUiState {
  final String message;
  const SkinAnalysisHistoryError(this.message);
}
