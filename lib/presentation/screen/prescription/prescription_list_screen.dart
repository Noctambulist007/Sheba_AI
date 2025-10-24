import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/auth/state/auth_ui_state.dart';
import 'package:sheba_ai/presentation/screen/my_orders/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/my_orders/state/my_orders_ui_state.dart';
import 'package:sheba_ai/presentation/screen/my_orders/widget/my_order_item.dart';
import 'package:sheba_ai/presentation/screen/my_orders/widget/my_order_item_shimmer.dart';
import 'package:sheba_ai/presentation/screen/prescription/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/prescription/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/prescription/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/prescription/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/prescription/state/prescription_ui_state.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/prescription_item.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/prescription_item_shimmer.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class PrescriptionListScreen extends ConsumerWidget {
  const PrescriptionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(prescriptionNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'My Prescriptions',
        leading: BackButton(color: AppColors.colorWhite),
      ),
      body: state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        initial: () => const SizedBox.shrink(),
        loading: () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => const PrescriptionItemShimmer(),
          ),
        ),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64.sp, color: Colors.red),
              SizedBox(height: 16.h),
              Text(
                'Error: $message',
                style: TextStyle(fontSize: 16.sp, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () async {
                  final authState = ref.read(authNotifierProvider);
                  if (authState is AuthenticatedState) {
                    final notifier = ref.read(
                      prescriptionNotifierProvider.notifier,
                    );
                    await notifier.fetchAllPrescriptions();
                  }
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
        success: (prescription, isLoadingMore, hasMore) {
          if (prescription.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                final authState = ref.read(authNotifierProvider);
                if (authState is AuthenticatedState) {
                  final notifier = ref.read(
                    prescriptionNotifierProvider.notifier,
                  );
                  await notifier.fetchAllPrescriptions();
                }
              },
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  Icon(
                    Icons.medication_outlined,
                    size: 64.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: Text(
                      'No prescriptions found.',
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          }

          final analyzedPrescriptions = prescription
              .where((p) => p.status.toLowerCase() == 'analyzed')
              .toList();

          return RefreshIndicator(
            onRefresh: () async {
              final authState = ref.read(authNotifierProvider);
              if (authState is AuthenticatedState) {
                final notifier = ref.read(
                  prescriptionNotifierProvider.notifier,
                );
                await notifier.fetchAllPrescriptions();
              }
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    if (analyzedPrescriptions.isEmpty)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.3,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.medication_outlined,
                                size: 64.sp,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'No analyzed prescriptions found.',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: analyzedPrescriptions.length,
                        itemBuilder: (context, index) {
                          final item = analyzedPrescriptions[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.prescriptionDetails,
                                arguments: item.id,
                              );
                            },
                            child: PrescriptionItem(prescription: item),
                          );
                        },
                      ),

                    if (isLoadingMore)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Center(
                          child: SizedBox(
                            width: 200.w,
                            child: LinearProgressIndicator(
                              color: AppColors.primary,
                              backgroundColor: AppColors.colorWhite,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
