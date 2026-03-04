import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/enum/medicine/medicine_filter.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/usecase/medicine/get_all_medicines_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';

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
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

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

    final result = await _useCase(page: _currentPage, search: _searchQuery);

    if (!mounted) return;

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
        if (loadMore && error.statusCode == 404) {
          _hasMore = false;
          _applyFilters();
        } else {
          state = MedicineUiState.error(error.message);
        }
      },
    );

    _isLoadingMore = false;
  }

  void search(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      fetchAllMedicines();
    });
  }

  void filter(MedicineFilter filter) {
    _filter = filter;
    _applyFilters();
  }

  void _applyFilters() {
    List<Medicine> filteredMedicines = List.from(_allMedicines);

    if (_searchQuery.isNotEmpty) {
      // Server side search is implemented, so no need to filter locally
    }

    switch (_filter) {
      case MedicineFilter.lowToHigh:
        filteredMedicines.sort(
          (a, b) => (double.tryParse(a.price ?? '0') ?? 0).compareTo(
            double.tryParse(b.price ?? '0') ?? 0,
          ),
        );
        break;
      case MedicineFilter.highToLow:
        filteredMedicines.sort(
          (a, b) => (double.tryParse(b.price ?? '0') ?? 0).compareTo(
            double.tryParse(a.price ?? '0') ?? 0,
          ),
        );
        break;
      case MedicineFilter.none:
        break;
    }

    if (!mounted) return;

    state = MedicineUiState.success(
      medicine: List.unmodifiable(filteredMedicines),
      isLoadingMore: _isLoadingMore,
      hasMore: _hasMore,
    );
  }

  bool get isLoadingMore => _isLoadingMore;

  bool get hasMore => _hasMore;
}
