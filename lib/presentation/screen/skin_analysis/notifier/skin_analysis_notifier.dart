import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/state/skin_analysis_ui_state.dart';
import 'package:sheba_ai/service/skin_analysis_service.dart';

class SkinAnalysisNotifier extends StateNotifier<SkinAnalysisUiState> {
  SkinAnalysisNotifier() : super(const SkinAnalysisInitial());

  Future<void> analyzeSkin({required String imagePath}) async {
    state = const SkinAnalysisLoading();

    try {
      final service = getIt<SkinAnalysisService>();
      final result = await service.analyzeSkinCondition(imagePath: imagePath);
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
