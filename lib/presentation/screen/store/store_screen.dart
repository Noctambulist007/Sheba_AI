import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/presentation/screen/cart/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/store/medicine_details_screen.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';
import 'package:sheba_ai/presentation/screen/store/widget/medicine_item.dart';
import 'package:sheba_ai/presentation/screen/store/widget/medicine_item_shimmer.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/store/notifier/provider.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class StoreScreen extends ConsumerStatefulWidget {
  const StoreScreen({super.key});

  @override
  ConsumerState<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends ConsumerState<StoreScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        final notifier = ref.read(medicineNotifierProvider.notifier);
        notifier.fetchAllMedicines(loadMore: true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    final notifier = ref.read(medicineNotifierProvider.notifier);
    await notifier.fetchAllMedicines();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(medicineNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Store',
        customActions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.cart);
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic-cart.svg',
                    width: 24.w,
                    height: 24.h,
                    color: Colors.white,
                  ),
                  // Cart item count badge
                  Consumer(
                    builder: (context, ref, _) {
                      final cartItemCount = ref.watch(cartNotifierProvider).items.length;
                      return cartItemCount > 0
                          ? Positioned(
                              right: -5,
                              top: -5,
                              child: Container(
                                padding: EdgeInsets.all(4.r),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 16.r,
                                  minHeight: 16.r,
                                ),
                                child: Text(
                                  cartItemCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.myOrders);
              },
              child: SvgPicture.asset(
                'assets/icons/ic-my-orders.svg',
                width: 20.w,
                height: 20.h,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemCount: 6,
            itemBuilder: (context, index) => const MedicineItemShimmer(),
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
        success: (medicine, isLoadingMore, hasMore) {
          if (medicine.isEmpty) {
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
                      'No medicines found.',
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
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 0.55.r,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: medicine.length,
                      itemBuilder: (context, index) {
                        final item = medicine[index];
                        return MedicineItem(
                          medicine: item,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.medicineDetails,
                              arguments: MedicineDetailsArgs(medicine: item),
                            );
                          },
                          onAddToCart: () {
                            // final cartItems = ref
                            //     .read(cartNotifierProvider)
                            //     .items;
                            // final exists = cartItems.any(
                            //   (item) =>
                            //       item.medicine.medicineId ==
                            //       item.medicine.medicineId,
                            // );
                            //
                            // if (!exists) {
                            //   ref
                            //       .read(cartNotifierProvider.notifier)
                            //       .addToCart(item);
                            // }
                            // ToastHelper.showSuccess(
                            //   context,
                            //   '${item.name} added to cart',
                            // );
                          },
                        );
                      },
                    ),

                    // Loading more indicator
                    if (hasMore)
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
