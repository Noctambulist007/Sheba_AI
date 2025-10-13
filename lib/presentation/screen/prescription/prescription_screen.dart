import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        showSearch: false,
        showCart: false,
        customActions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: IconButton(
              onPressed: () {
                profileState.when(
                  loading: () {},
                  anonymous: () {
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                  success: (profile) {
                    Navigator.pushNamed(
                      context,
                      Routes.profile,
                      arguments: ProfileArgs(userProfile: profile)
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SvgPicture.asset('assets/images/empty-chat.svg'),
              // SizedBox(height: 20.h),
              Text(
                'Upload Your Prescription',
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
