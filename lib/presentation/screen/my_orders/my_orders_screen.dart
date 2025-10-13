import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/screen/my_orders/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/my_orders/state/my_orders_ui_state.dart';
import 'package:sheba_ai/presentation/screen/my_orders/widget/my_order_item.dart';
import 'package:sheba_ai/presentation/screen/my_orders/widget/my_order_item_shimmer.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class MyOrdersScreen extends ConsumerStatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  ConsumerState<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends ConsumerState<MyOrdersScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final notifier = ref.read(myOrdersNotifierProvider.notifier);
      final state = ref.read(myOrdersNotifierProvider);

      state.maybeWhen(
        success: (_, isLoadingMore, hasMore) {
          if (!isLoadingMore &&
              hasMore &&
              _scrollController.position.pixels >=
                  _scrollController.position.maxScrollExtent - 200) {
            notifier.fetchMyOrders(loadMore: true);
          }
        },
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    final notifier = ref.read(myOrdersNotifierProvider.notifier);
    await notifier.fetchMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myOrdersNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(title: 'My Orders', leading: BackButton(color: AppColors.colorWhite)),
      body: state.when(
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
              ElevatedButton(onPressed: _onRefresh, child: const Text("Retry")),
            ],
          ),
        ),
        success: (order, isLoadingMore, hasMore) {
          if (order.isEmpty) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
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
                      itemCount: order.length,
                      itemBuilder: (context, index) {
                        final item = order[index];
                        return GestureDetector(
                          onTap: () {},
                          child: MyOrderItemCard(order: item)
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
