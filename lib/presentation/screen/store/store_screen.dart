import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/screen/store/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/store/state/medicine_ui_state.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class StoreScreen extends ConsumerWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicineUiState = ref.watch(medicineNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Store',
        showSearch: false,
        showCart: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: medicineUiState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),

          success: (medicine) => ListView.builder(
            itemCount: medicine.length,
            itemBuilder: (context, index) {
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
          ),
          error: (message) => Center(child: Text('Error: $message')),
        ),
      ),
    );
  }
}
