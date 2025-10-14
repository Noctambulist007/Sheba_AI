import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/carousel_slider_section.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/prescription_step.dart';
import 'package:sheba_ai/presentation/screen/profile/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/profile/profile_screen.dart';
import 'package:sheba_ai/presentation/screen/profile/state/profile_ui_state.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class PrescriptionScreen extends ConsumerWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: profileState.when(
          loading: () => 'Loading...',
          anonymous: () => 'Hi, Guest',
          success: (profile) => 'Hi, ${profile.username}',
          error: (message) => 'Error',
        ),
        customActions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: IconButton(
              onPressed: () {
                profileState.when(
                  loading: () {},
                  anonymous: () => Navigator.pushNamed(context, Routes.signIn),
                  success: (profile) {
                    Navigator.pushNamed(
                      context,
                      Routes.profile,
                      arguments: ProfileArgs(userProfile: profile),
                    );
                  },
                  error: (message) {
                    ToastHelper.showError(context, message);
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                );
              },
              icon: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.person, size: 24.w, color: Colors.white),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.primary.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  // Carousel Section
                  CarouselSliderSection(), //

                  SizedBox(height: 16.h),
                  //
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
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grayscaleTextTitle,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sheba.AI',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            TextSpan(
                              text: ' Works',
                              style: TextStyle(
                                fontSize: 20.sp,
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
              ),
            ),
            SizedBox(height: 16.h),

          ],
        ),
      ),
    );
  }
}
