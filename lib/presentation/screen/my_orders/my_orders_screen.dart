import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/screen/my_orders/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/my_orders/state/my_orders_ui_state.dart';
import 'package:sheba_ai/presentation/screen/my_orders/widget/my_order_item.dart';
import 'package:sheba_ai/presentation/screen/my_orders/widget/my_order_item_shimmer.dart';
import 'package:sheba_ai/presentation/screen/profile/notifier/provider.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class MyOrdersScreen extends ConsumerWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myOrdersNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'My Orders',
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
            itemBuilder: (context, index) => const MyOrderItemShimmer(),
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
                  final notifier = ref.read(myOrdersNotifierProvider.notifier);
                  await notifier.fetchMyOrders();
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
        success: (order, isLoadingMore, hasMore) {
          if (order.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                final notifier = ref.read(myOrdersNotifierProvider.notifier);
                await notifier.fetchMyOrders();
              },
              child: ListView(
                children: [
                  SizedBox(height: 100.h),
                  Icon(
                    Icons.medication_outlined,
                    size: 64.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: Text(
                      'No orders found.',
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              final notifier = ref.read(myOrdersNotifierProvider.notifier);
              await notifier.fetchMyOrders();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: order.length,
                      itemBuilder: (context, index) {
                        final item = order[index];
                        return GestureDetector(
                          onTap: () {},
                          child: MyOrderItemCard(order: item),
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
