import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_result.dart';

sealed class SkinAnalysisUiState {
  const SkinAnalysisUiState();
}

class SkinAnalysisInitial extends SkinAnalysisUiState {
  const SkinAnalysisInitial();
}

class SkinAnalysisLoading extends SkinAnalysisUiState {
  const SkinAnalysisLoading();
}

class SkinAnalysisSuccess extends SkinAnalysisUiState {
  final SkinAnalysisResult result;
  const SkinAnalysisSuccess({required this.result});
}

class SkinAnalysisError extends SkinAnalysisUiState {
  final String message;
  const SkinAnalysisError(this.message);
}
