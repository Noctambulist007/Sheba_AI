import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/data/datasource/local/database_helper.dart';
import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_record.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/state/skin_analysis_ui_state.dart';
import 'package:sheba_ai/data/datasource/remote/service/skin_analysis_service.dart';

class SkinAnalysisNotifier extends StateNotifier<SkinAnalysisUiState> {
  SkinAnalysisNotifier() : super(const SkinAnalysisInitial());

  Future<void> analyzeSkin({required String imagePath}) async {
    state = const SkinAnalysisLoading();

    try {
      final service = getIt<SkinAnalysisService>();
      final result = await service.analyzeSkinCondition(imagePath: imagePath);

      final record = SkinAnalysisRecord(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: imagePath,
        analysis: result.analysis,
        confidence: result.confidence,
        summary: result.summary,
        severity: result.severity,
        analyzedAt: result.analyzedAt,
      );
      await DatabaseHelper().insertSkinAnalysisRecord(record);

      state = SkinAnalysisSuccess(result: result);
    } catch (e) {
      state = SkinAnalysisError(
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  void reset() {
    state = const SkinAnalysisInitial();
  }
}
