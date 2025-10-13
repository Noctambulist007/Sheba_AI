import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Cart',
        leading: BackButton(color: AppColors.colorWhite),
      ),
      body: Center(
        child: Text(
          'This is the Cart screen',
          style: TextStyle(fontSize: 16.sp, color: AppColors.colorTextTitle),
        ),
      ),
    );
  }
}
