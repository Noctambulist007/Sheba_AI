import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/prescription/create_prescription_request.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/domain/usecase/prescription/analyze_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/create_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/delete_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/get_all_prescriptions_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/get_prescription_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_ai/presentation/screen/prescription/state/prescription_ui_state.dart';

class PrescriptionNotifier extends StateNotifier<PrescriptionUiState> {
  PrescriptionNotifier() : super(const PrescriptionUiState.initial()) {
    fetchAllPrescriptions();
  }

  final _useCase = getIt<GetAllPrescriptionsUseCase>();
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  final List<Prescription> _prescription = [];

  Future<void> fetchAllPrescriptions({bool loadMore = false}) async {
    if (_isLoadingMore) return;
    if (loadMore && !_hasMore) return;

    if (!loadMore) {
      state = const PrescriptionUiState.loading();
      _currentPage = 1;
      _prescription.clear();
      _hasMore = true;
    }

    _isLoadingMore = loadMore;

    final result = await _useCase(page: _currentPage);

    result.when(
      success: (newPrescriptions) {
        if (!loadMore && newPrescriptions.isEmpty) {
          _hasMore = false;
          _isLoadingMore = false;
          state = const PrescriptionUiState.success(
            prescription: [],
            hasMore: false,
          );
          return;
        }

        if (newPrescriptions.isEmpty) {
          _hasMore = false;
        } else {
          _prescription.addAll(newPrescriptions);
          _currentPage++;
        }

        _isLoadingMore = false;

        state = PrescriptionUiState.success(
          prescription: List.unmodifiable(_prescription),
          isLoadingMore: _isLoadingMore,
          hasMore: _hasMore,
        );
      },
      failure: (error) {
        _isLoadingMore = false;
        state = PrescriptionUiState.error(error.message);
      },
    );
  }

  Future<void> getPrescription({required int prescriptionId}) async {
    state = const PrescriptionUiState.loading();

    final useCase = getIt<GetPrescriptionUseCase>();
    final result = await useCase(prescriptionId: prescriptionId);

    result.when(
      success: (prescription) {
        state = PrescriptionUiState.success(
          prescription: [prescription],
          hasMore: false,
        );
      },
      failure: (error) {
        state = PrescriptionUiState.error(error.message);
      },
    );
  }

  Future<void> createPrescriptionWithPath(String imagePath) async {
    state = const PrescriptionUiState.loading();

    final useCase = getIt<CreatePrescriptionUseCase>();
    final result = await useCase(
      requestBody: CreatePrescriptionRequest(image: imagePath),
    );

    result.when(
      success: (prescription) {
        analyzePrescription(prescriptionId: prescription.id);
      },
      failure: (error) {
        state = PrescriptionUiState.error(error.message);
      },
    );
  }

  Future<void> createPrescription() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile == null) return;

    await createPrescriptionWithPath(pickedFile.path);
  }

  Future<void> analyzePrescription({required int prescriptionId}) async {
    final useCase = getIt<AnalyzePrescriptionUseCase>();
    final result = await useCase(prescriptionId: prescriptionId);

    result.when(
      success: (analyzePrescription) {
        state = PrescriptionUiState.analyzeSuccess(
          analyzePrescription: analyzePrescription,
        );
        fetchAllPrescriptions();
      },
      failure: (error) {
        state = PrescriptionUiState.error(error.message);
      },
    );
  }

  Future<void> deletePrescription({required int prescriptionId}) async {
    state = const PrescriptionUiState.loading();

    final useCase = getIt<DeletePrescriptionUseCase>();
    final result = await useCase(prescriptionId: prescriptionId);

    result.when(
      success: (_) {
        state = const PrescriptionUiState.initial();
        fetchAllPrescriptions();
      },
      failure: (failure) {
        state = PrescriptionUiState.error(failure.message);
      },
    );
  }
}
