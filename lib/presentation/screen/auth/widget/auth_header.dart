import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo/app-logo.png',
          width: 100.w,
          height: 100.h,
        ), //

        SizedBox(height: 16.h),

        Text(
          title,
          style: AppTextStyles.labelL4Semibold.copyWith(
            color: AppColors.grayscaleTextBody,
          ),
        ), //
      ],
    );
  }
}
