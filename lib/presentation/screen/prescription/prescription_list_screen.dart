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
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class PrescriptionListScreen extends ConsumerStatefulWidget {
  const PrescriptionListScreen({super.key});

  @override
  ConsumerState<PrescriptionListScreen> createState() =>
      _PrescriptionListScreenState();
}

class _PrescriptionListScreenState
    extends ConsumerState<PrescriptionListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final authState = ref.read(authNotifierProvider);
      if (authState is AuthenticatedState) {
        final notifier = ref.read(prescriptionNotifierProvider.notifier);
        final state = ref.read(prescriptionNotifierProvider);

        state.maybeWhen(
          success: (_, isLoadingMore, hasMore) {
            if (!isLoadingMore &&
                hasMore &&
                _scrollController.position.pixels >=
                    _scrollController.position.maxScrollExtent - 200) {
              notifier.fetchAllPrescriptions(loadMore: true);
            }
          },
          orElse: () {},
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    final authState = ref.read(authNotifierProvider);
    if (authState is AuthenticatedState) {
      final notifier = ref.read(prescriptionNotifierProvider.notifier);
      await notifier.fetchAllPrescriptions();
    }
  }

  @override
  Widget build(BuildContext context) {
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
              ElevatedButton(onPressed: _onRefresh, child: const Text("Retry")),
            ],
          ),
        ),
        success: (prescription, isLoadingMore, hasMore) {
          if (prescription.isEmpty) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
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

          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: prescription.length,
                      itemBuilder: (context, index) {
                        final item = prescription[index];
                        return GestureDetector(
                          onTap: () {},
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
