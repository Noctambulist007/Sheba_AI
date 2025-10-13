import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sheba_ai/presentation/screen/store/medicine_details_screen.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';
import 'package:sheba_ai/presentation/screen/store/widget/medicine_item.dart';
import 'package:sheba_ai/presentation/screen/store/widget/medicine_item_shimmer.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/store/notifier/provider.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
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

    // Infinite scroll listener
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

  /// Pull to refresh action
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
        showSearch: false,
        showCart: false,
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
              ElevatedButton(
                onPressed: _onRefresh,
                child: const Text("Retry"),
              ),
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
                  Icon(Icons.medication_outlined,
                      size: 64.sp, color: Colors.grey),
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
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 0.70,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: medicine.length,
                      itemBuilder: (context, index) {
                        final item = medicine[index];
                        return GestureDetector(
                          onTap: () {
                           Navigator.pushNamed(
                              context,
                              Routes.medicineDetails,
                              arguments: MedicineDetailsArgs(medicine: item),
                            );
                          },
                          child: MedicineItem(medicine: item),
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
