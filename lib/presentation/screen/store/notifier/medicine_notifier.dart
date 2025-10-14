import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/usecase/medicine/get_all_medicines_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';

enum MedicineFilter {
  none,
  lowToHigh,
  highToLow,
}

class MedicineNotifier extends StateNotifier<MedicineUiState> {
  MedicineNotifier() : super(const MedicineUiState.initial()) {
    fetchAllMedicines();
  }

  final _useCase = getIt<GetAllMedicinesUseCase>();
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  final List<Medicine> _allMedicines = [];
  String _searchQuery = '';
  MedicineFilter _filter = MedicineFilter.none;

  Future<void> fetchAllMedicines({bool loadMore = false}) async {
    if (_isLoadingMore) return;
    if (loadMore && !_hasMore) return;

    if (!loadMore) {
      state = const MedicineUiState.loading();
      _currentPage = 1;
      _allMedicines.clear();
      _hasMore = true;
    } else {
      _isLoadingMore = true;
    }

    final result = await _useCase(page: _currentPage);

    result.when(
      success: (newMedicines) {
        if (newMedicines.isEmpty) {
          _hasMore = false;
        } else {
          _allMedicines.addAll(newMedicines);
          _currentPage++;
        }
        _applyFilters();
      },
      failure: (error) {
        state = MedicineUiState.error(error.message);
      },
    );

    _isLoadingMore = false;
  }

  void search(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void filter(MedicineFilter filter) {
    _filter = filter;
    _applyFilters();
  }

  void _applyFilters() {
    List<Medicine> filteredMedicines = List.from(_allMedicines);

    if (_searchQuery.isNotEmpty) {
      filteredMedicines = filteredMedicines
          .where((medicine) =>
              medicine.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    switch (_filter) {
      case MedicineFilter.lowToHigh:
        filteredMedicines.sort((a, b) =>
            (double.tryParse(a.price ?? '0') ?? 0)
                .compareTo(double.tryParse(b.price ?? '0') ?? 0));
        break;
      case MedicineFilter.highToLow:
        filteredMedicines.sort((a, b) =>
            (double.tryParse(b.price ?? '0') ?? 0)
                .compareTo(double.tryParse(a.price ?? '0') ?? 0));
        break;
      case MedicineFilter.none:
        break;
    }

    state = MedicineUiState.success(
      medicine: List.unmodifiable(filteredMedicines),
      isLoadingMore: _isLoadingMore,
      hasMore: _hasMore,
    );
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;
}
