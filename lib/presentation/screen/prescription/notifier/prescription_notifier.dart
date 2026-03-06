import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/data/datasource/remote/model/request/prescription/create_prescription_request.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/domain/model/reminder/reminder.dart';
import 'package:sheba_ai/domain/usecase/prescription/analyze_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/create_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/delete_prescription_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/get_all_prescriptions_use_case.dart';
import 'package:sheba_ai/domain/usecase/prescription/get_prescription_use_case.dart';
import 'package:sheba_ai/domain/util/result.dart';
import 'package:sheba_ai/injection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_ai/presentation/screen/auth/state/auth_ui_state.dart';
import 'package:sheba_ai/presentation/screen/prescription/state/prescription_ui_state.dart';
import 'package:sheba_ai/presentation/screen/cart/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/reminder/notifier/reminder_notifier.dart';
import 'package:sheba_ai/domain/model/medicine/medicine.dart';
import 'package:sheba_ai/domain/model/medicine/manufacturer.dart';
import 'package:sheba_ai/domain/model/medicine/generic.dart';
import 'package:sheba_ai/domain/model/medicine/dosage_form.dart';
import 'package:sheba_ai/presentation/screen/prescription/util/medicine_time_parser.dart';

class PrescriptionNotifier extends StateNotifier<PrescriptionUiState> {
  PrescriptionNotifier(this._ref, this._authUiState)
    : super(const PrescriptionUiState.initial()) {
    _authUiState.maybeWhen(
      orElse: () {},
      authenticated: (user) {
        fetchAllPrescriptions();
      },
    );
  }

  final Ref _ref;
  final AuthUiState _authUiState;
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
    final previousPrescriptions = List<Prescription>.from(_prescription);

    state = const PrescriptionUiState.loading();

    final useCase = getIt<GetPrescriptionUseCase>();
    final result = await useCase(prescriptionId: prescriptionId);

    result.when(
      success: (prescription) {
        final index = previousPrescriptions.indexWhere((p) => p.id == prescriptionId);
        if (index != -1) {
          previousPrescriptions[index] = prescription;
        } else {
          previousPrescriptions.insert(0, prescription);
        }
        _prescription
          ..clear()
          ..addAll(previousPrescriptions);

        state = PrescriptionUiState.success(
          prescription: List.unmodifiable(_prescription),
          hasMore: _hasMore,
        );
      },
      failure: (error) {
        _prescription
          ..clear()
          ..addAll(previousPrescriptions);
        state = PrescriptionUiState.success(
          prescription: List.unmodifiable(_prescription),
          hasMore: _hasMore,
        );
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

        if (analyzePrescription.matchedMedicines != null) {
          final cartNotifier = _ref.read(cartNotifierProvider.notifier);
          final reminderNotifier = _ref.read(reminderNotifierProvider.notifier);

          for (final matchedMedicine in analyzePrescription.matchedMedicines!) {
             final medicine = Medicine(
              medicineId: matchedMedicine.id,
              name: matchedMedicine.name,
              slug: matchedMedicine.name.toLowerCase().replaceAll(' ', '-'),
              strength: matchedMedicine.extractDetails?.strength ?? '',
              manufacturer: Manufacturer(
                  manufacturerId: 0,
                  name: '',
                  slug: '',
                  genericsCount: 0,
                  brandNamesCount: 0,
                  createdAt: DateTime.now().toIso8601String(),
                  updatedAt: DateTime.now().toIso8601String()),
              generic: Generic(
                genericId: 0,
                name: matchedMedicine.genericName,
                slug: matchedMedicine.genericName.toLowerCase().replaceAll(' ', '-'),
                brandNamesCount: 0,
              ),
              dosageForm: DosageForm(
                dosageFormId: 0,
                name: matchedMedicine.extractDetails?.type ?? 'Tablet',
                slug: (matchedMedicine.extractDetails?.type ?? 'Tablet')
                    .toLowerCase(),
                genericsCount: 0,
                createdAt: DateTime.now().toIso8601String(),
                updatedAt: DateTime.now().toIso8601String(),
              ),
              price: matchedMedicine.price,
              formattedPrice: '৳${matchedMedicine.price}',
              unit: 'Piece',
            );

            cartNotifier.addToCart(medicine);

            final frequency = matchedMedicine.extractDetails?.frequency ?? '';
            final instructions = matchedMedicine.extractDetails?.instructions;

            final times = MedicineTimeParser.parse(frequency, instructions);

            for (final time in times) {
              final now = DateTime.now();
              final scheduledTime = DateTime(
                now.year,
                now.month,
                now.day,
                time.hour,
                time.minute,
              );

              final reminder = Reminder(
                id: '${matchedMedicine.id}_${time.hour}_${time.minute}',
                medicineName: matchedMedicine.name,
                dosage: matchedMedicine.extractDetails?.strength ?? '',
                type: matchedMedicine.extractDetails?.type ?? 'Tablet',
                frequency: 'Daily',
                time: scheduledTime,
                isEnabled: true,
              );

              reminderNotifier.addReminder(reminder);
            }
          }
        }

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
