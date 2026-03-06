import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/data/datasource/local/database_helper.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/history/notifier/skin_analysis_history_notifier.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/history/state/skin_analysis_history_ui_state.dart';

final skinAnalysisHistoryNotifierProvider = StateNotifierProvider<
    SkinAnalysisHistoryNotifier, SkinAnalysisHistoryUiState>(
  (ref) => SkinAnalysisHistoryNotifier(DatabaseHelper()),
);
