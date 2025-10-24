import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/enum/medicine/medicine_filter.dart';
import 'package:sheba_ai/presentation/screen/cart/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/profile/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/profile/state/profile_ui_state.dart';
import 'package:sheba_ai/presentation/screen/store/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/store/notifier/medicine_notifier.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';
import 'package:sheba_ai/presentation/screen/store/medicine_details_screen.dart';
import 'package:sheba_ai/presentation/screen/store/widget/medicine_item.dart';
import 'package:sheba_ai/presentation/screen/store/widget/medicine_item_shimmer.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
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
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref
            .read(medicineNotifierProvider.notifier)
            .fetchAllMedicines(loadMore: true);
      }
    });

    _searchController.addListener(() {
      ref
          .read(medicineNotifierProvider.notifier)
          .search(_searchController.text);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await ref.read(medicineNotifierProvider.notifier).fetchAllMedicines();
  }

  @override
  Widget build(BuildContext context) {
    final profileUiState = ref.watch(profileNotifierProvider);
    final state = ref.watch(medicineNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Store',
        customActions: [
          profileUiState.maybeWhen(
            success: (profile) => Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Routes.cart),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic-cart.svg',
                          width: 24.w,
                          height: 24.h,
                          color: Colors.white,
                        ),
                        Consumer(
                          builder: (context, ref, _) {
                            final count = ref
                                .watch(cartNotifierProvider)
                                .items
                                .length;
                            return count > 0
                                ? Positioned(
                                    right: -5,
                                    top: -5,
                                    child: Container(
                                      padding: EdgeInsets.all(4.r),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: 16.r,
                                        minHeight: 16.r,
                                      ),
                                      child: Text(
                                        count.toString(),
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
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),

      /// Single scrollable body with RefreshIndicator
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search medicines',
                          prefixIcon: Icon(
                            Icons.search,
                            size: 24.sp,
                            color: AppColors.grayscaleTextSubtitle,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 16.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      flex: 1,
                      child: PopupMenuButton<MedicineFilter>(
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.black87,
                        ),
                        onSelected: (filter) {
                          ref
                              .read(medicineNotifierProvider.notifier)
                              .filter(filter);
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: MedicineFilter.none,
                            child: Text(
                              'None',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: MedicineFilter.lowToHigh,
                            child: Text(
                              'Price: Low to High',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: MedicineFilter.highToLow,
                            child: Text(
                              'Price: High to Low',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            state.when(
              initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),

              /// Loading shimmer
              loading: () => SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childCount: 6,
                  itemBuilder: (context, index) => const MedicineItemShimmer(),
                ),
              ),

              /// Error State
              error: (msg) => SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 64.sp, color: Colors.red),
                      SizedBox(height: 16.h),
                      Text(
                        'Error: $msg',
                        style: TextStyle(fontSize: 16.sp, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: _onRefresh,
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                ),
              ),

              /// Success state with scrolling grid
              success: (medicine, isLoadingMore, hasMore) {
                if (medicine.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medication_outlined,
                            size: 64.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'No medicines found.',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                    childCount: medicine.length,
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
                          final cartNotifier = ref.read(cartNotifierProvider.notifier);
                          
                          // Try to add to cart, returns false if user is not authenticated
                          final success = cartNotifier.addToCart(item);
                          
                          if (success) {
                            // Successfully added to cart
                            ToastHelper.showSuccess(
                              context,
                              '${item.name} added to cart',
                            );
                          } else {
                            // User is not authenticated, show login prompt
                            ToastHelper.showError(
                              context,
                              'Please login to order',
                            );
                            Navigator.pushNamed(context, Routes.signIn);
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),

            /// Loading more indicator
            SliverToBoxAdapter(
              child: state.maybeWhen(
                success: (_, isLoadingMore, hasMore) => hasMore
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Center(
                          child: SizedBox(
                            width: 200.w,
                            child: LinearProgressIndicator(
                              color: AppColors.primary,
                              backgroundColor: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
