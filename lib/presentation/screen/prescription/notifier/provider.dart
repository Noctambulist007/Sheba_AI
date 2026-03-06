import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/prescription/notifier/prescription_notifier.dart';
import 'package:sheba_ai/presentation/screen/prescription/state/prescription_ui_state.dart';

typedef PrescriptionNotifierProvider =
    StateNotifierProvider<PrescriptionNotifier, PrescriptionUiState>;

final PrescriptionNotifierProvider prescriptionNotifierProvider =
    StateNotifierProvider(
  (ref) => PrescriptionNotifier(ref, ref.watch(authNotifierProvider)),
);

final selectedImageProvider = StateProvider<XFile?>((ref) => null);
