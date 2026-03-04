import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/store/notifier/medicine_notifier.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';

typedef MedicineNotifierProvider =
    AutoDisposeStateNotifierProvider<MedicineNotifier, MedicineUiState>;

final MedicineNotifierProvider medicineNotifierProvider =
    StateNotifierProvider.autoDispose(
  (ref) => MedicineNotifier(),
);
