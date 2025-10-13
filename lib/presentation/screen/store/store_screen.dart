import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/screen/store/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text('Error: $message')),
          success: (medicine, isLoadingMore, hasMore) {
            if (medicine.isEmpty) {
              return const Center(child: Text('No medicines found.'));
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: hasMore ? medicine.length + 1 : medicine.length,
              itemBuilder: (context, index) {
                if (index == medicine.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: LinearProgressIndicator(
                      color: AppColors.primary,
                      backgroundColor: AppColors.colorWhite,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    )),
                  );
                }

                final item = medicine[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('${item.strength} - ${item.formattedPrice}'),
                  trailing: Text(item.manufacturer.name),
                  leading: CircleAvatar(
                    child: Text(item.name.isNotEmpty ? item.name[0] : '?'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
