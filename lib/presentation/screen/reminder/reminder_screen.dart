import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Reminders',

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SvgPicture.asset('assets/images/empty-chat.svg'),
              // SizedBox(height: 20.h),
              Text(
                'No Reminders Set',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grayscaleTextSubtitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}