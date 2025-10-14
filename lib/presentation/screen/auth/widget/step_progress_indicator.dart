import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: List.generate(
          totalSteps,
              (index) => Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: index < totalSteps - 1 ? 8.w : 0,
              ),
              height: 4.h,
              decoration: BoxDecoration(
                color: index <= currentStep
                    ? AppColors.primary
                    : AppColors.grayscaleBorderDisabled.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}