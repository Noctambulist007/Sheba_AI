import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/usecase/medicine/get_all_medicines_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';

class MedicineNotifier extends StateNotifier<MedicineUiState> {
  MedicineNotifier() : super(const MedicineUiState.loading()) {
    fetchAllMedicines();
  }

  Future<void> fetchAllMedicines() async {
    state = const MedicineUiState.loading();

    final useCase = getIt<GetAllMedicinesUseCase>();
    final result = await useCase();

    state = result.when(
      success: (medicine) {
        return MedicineUiState.success(medicine: medicine);
      },
      failure: (error) => MedicineUiState.error(error.message),
    );
  }
}
