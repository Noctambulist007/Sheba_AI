import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

class HowShebaAiWorks extends StatelessWidget {
  const HowShebaAiWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome,
              color: AppColors.primary,
              size: 24.w,
            ),
            SizedBox(width: 8.w),
            Text.rich(
              TextSpan(
                text: 'How ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grayscaleTextTitle,
                ),
                children: [
                  TextSpan(
                    text: 'Sheba.AI',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: ' Works',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grayscaleTextTitle,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.auto_awesome,
              color: AppColors.primary,
              size: 24.w,
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          "Your Smart Health Assistant in 3 Easy Steps",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.grayscaleTextSubtitle,
          ),
        ),
      ],
    );
  }
}
