import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/notifier/skin_analysis_notifier.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/state/skin_analysis_ui_state.dart';

final skinAnalysisNotifierProvider =
    StateNotifierProvider<SkinAnalysisNotifier, SkinAnalysisUiState>(
  (ref) => SkinAnalysisNotifier(),
);

final skinSelectedImageProvider = StateProvider<XFile?>((ref) => null);
