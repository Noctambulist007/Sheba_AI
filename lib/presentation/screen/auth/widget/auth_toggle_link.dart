import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color.dart' as AppColors;

class AuthToggleLink extends StatelessWidget {
  const AuthToggleLink({
    super.key,
    required this.prompt,
    required this.linkText,
    required this.onTap,
  });

  final String prompt;
  final String linkText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            text: prompt,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16.sp,
                  height: 20.sp / 16.sp,
                  letterSpacing: 0.31.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                ),
            children: [
              TextSpan(
                text: linkText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.AppColors.primary,
                      fontSize: 16.sp,
                      height: 20.sp / 16.sp,
                      letterSpacing: 0.31.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
