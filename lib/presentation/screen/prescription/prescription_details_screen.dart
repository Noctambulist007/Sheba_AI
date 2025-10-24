import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/domain/model/prescription/matched_medicine.dart';
import 'package:sheba_ai/domain/model/prescription/prescription.dart';
import 'package:sheba_ai/domain/model/prescription/unmatched_medicine.dart';
import 'package:sheba_ai/presentation/screen/cart/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/prescription/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/prescription/state/prescription_ui_state.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';
import 'package:timeago/timeago.dart' as timeago;

class PrescriptionDetailsArgs {
  final int prescriptionId;

  PrescriptionDetailsArgs({required this.prescriptionId});
}

class PrescriptionDetailsScreen extends ConsumerStatefulWidget {
  const PrescriptionDetailsScreen({super.key});

  @override
  ConsumerState<PrescriptionDetailsScreen> createState() =>
      _PrescriptionDetailsScreenState();
}

class _PrescriptionDetailsScreenState
    extends ConsumerState<PrescriptionDetailsScreen> {
  int? prescriptionId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is PrescriptionDetailsArgs) {
        prescriptionId = args.prescriptionId;
      } else if (args is int) {
        prescriptionId = args;
      }
      
      if (prescriptionId != null) {
        ref
            .read(prescriptionNotifierProvider.notifier)
            .getPrescription(prescriptionId: prescriptionId!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(prescriptionNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Prescription Details',
        leading: BackButton(color: AppColors.colorWhite),
      ),
      body: prescriptionId == null
        ? const Center(child: Text("No prescription ID provided"))
        : uiState.when(
            initial: () => const Center(child: Text("Initializing...")),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (prescriptions, _, __) {
              // Find the prescription with matching ID, or return error if not found
              final prescriptionIndex = prescriptions.indexWhere(
                (p) => p.id == prescriptionId,
              );
              
              if (prescriptionIndex == -1) {
                return Center(child: Text("Prescription #$prescriptionId not found"));
              }
              
              return _buildPrescriptionDetails(context, prescriptions[prescriptionIndex]);
            },
        analyzeSuccess: (_) =>
            const Center(child: Text("Analysis data not used here.")),
        error: (msg) => Center(child: Text("Error: $msg")),
      ),
    );
  }

  Widget _buildPrescriptionDetails(BuildContext context, Prescription p) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image — flat, no shadow
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                p.image,
                height: 220.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 220.h,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported, size: 40),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          Text(
            "Status: ${p.status}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            "Created ${timeago.format(DateTime.parse(p.createdAt))}",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12.sp),
          ),
          SizedBox(height: 20.h),

          if (p.matchedMedicines?.isNotEmpty ?? false) ...[
            Text(
              "Matched Medicines",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            ...p.matchedMedicines!.map(_buildMatchedMedicineCard),
          ] else
            _buildEmptySection("No matched medicines found", Icons.medication),

          SizedBox(height: 24.h),

          if (p.unmatchedMedicines?.isNotEmpty ?? false) ...[
            Text(
              "Unmatched Medicines",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: p.unmatchedMedicines!
                    .map(_buildUnmatchedMedicineItem)
                    .toList(),
              ),
            ),
          ] else
            _buildEmptySection("All medicines are available", Icons.check),
        ],
      ),
    );
  }

  Widget _buildMatchedMedicineCard(MatchedMedicine m) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  m.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  m.genericName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "৳${m.price}",
                  style: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),

          // TextButton.icon(
          //   onPressed: () {
          //     ref.read(cartNotifierProvider.notifier).addToCart(m);
          //     ToastHelper.showSuccess(context, '${medicine.name} added to cart');
          //   },
          //   icon: const Icon(Icons.add, size: 18),
          //   label: const Text("Add"),
          //   style: TextButton.styleFrom(
          //     foregroundColor: Colors.green.shade700,
          //     backgroundColor: Colors.green.shade50,
          //     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8.r),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildUnmatchedMedicineItem(UnmatchedMedicine u) => Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      children: [
        const Icon(Icons.error_outline, color: Colors.orange, size: 18),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            u.name,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade800),
          ),
        ),
      ],
    ),
  );

  Widget _buildEmptySection(String text, IconData icon) => Container(
    padding: EdgeInsets.all(14.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.grey.shade500),
        SizedBox(width: 8.w),
        Text(text, style: TextStyle(color: Colors.grey.shade600)),
      ],
    ),
  );
}
