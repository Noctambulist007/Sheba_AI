import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/store/notifier/medicine_notifier.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';

typedef MedicineNotifierProvider =
    StateNotifierProvider<MedicineNotifier, MedicineUiState>;

final MedicineNotifierProvider medicineNotifierProvider = StateNotifierProvider(
  (ref) => MedicineNotifier(),
);
