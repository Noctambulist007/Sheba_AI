import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

class AnalysisErrorBanner extends StatelessWidget {
  final VoidCallback onRetry;

  const AnalysisErrorBanner({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.errorContainer,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: AppColors.error, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'Analysis failed. Please try again.',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.errorDark,
                ),
              ),
            ),
            TextButton(
              onPressed: onRetry,
              child: Text(
                'Retry',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
