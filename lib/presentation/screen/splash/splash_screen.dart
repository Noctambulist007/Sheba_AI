import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color.dart';
import '../../util/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.main);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackgroundPrimary,
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(32.w),
            padding: EdgeInsets.all(40.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Image.asset(
                  'assets/logo/app-logo.png',
                  width: 80.w,
                  height: 80.w,
                ).animate().fadeIn(duration: 600.ms).scale(delay: 200.ms),

                SizedBox(height: 32.h),

                // App Name
                Text.rich(
                  TextSpan(
                    text: 'Sheba',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    children: [
                      TextSpan(
                        text: '.AI',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 400.ms).slideY(
                  begin: 0.3,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),

                SizedBox(height: 12.h),

                // Tagline
                Text(
                  'Your AI Health Assistant',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 600.ms).slideY(
                  begin: 0.3,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),

                SizedBox(height: 40.h),

                // Loading indicator
                Column(
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                        backgroundColor: AppColors.gray200,
                        borderRadius: BorderRadius.circular(8.r),
                      ).animate().fadeIn(duration: 600.ms).slideY(
                        begin: 0.3,
                        duration: 500.ms,
                        curve: Curves.easeOut,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ).animate().fadeIn(delay: 800.ms),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
