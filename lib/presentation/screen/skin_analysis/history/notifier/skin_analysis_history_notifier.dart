import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/data/datasource/local/database_helper.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/history/state/skin_analysis_history_ui_state.dart';

class SkinAnalysisHistoryNotifier
    extends StateNotifier<SkinAnalysisHistoryUiState> {
  final DatabaseHelper _dbHelper;

  SkinAnalysisHistoryNotifier(this._dbHelper)
      : super(const SkinAnalysisHistoryInitial());

  Future<void> loadHistory() async {
    state = const SkinAnalysisHistoryLoading();
    try {
      final records = await _dbHelper.getSkinAnalysisHistory();
      state = SkinAnalysisHistoryLoaded(records: records);
    } catch (e) {
      state = SkinAnalysisHistoryError(e.toString());
    }
  }

  Future<void> deleteRecord(String id) async {
    await _dbHelper.deleteSkinAnalysisRecord(id);
    await loadHistory();
  }
}
