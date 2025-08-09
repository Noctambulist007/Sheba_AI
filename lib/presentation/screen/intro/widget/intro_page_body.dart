import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';

class IntroPageBody extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showButtons;
  final VoidCallback? onSignIn;
  final VoidCallback? onSignUp;

  const IntroPageBody({
    super.key,
    required this.title,
    required this.subtitle,
    this.showButtons = false,
    this.onSignIn,
    this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: showButtons ? 2 : 3),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryColour,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (showButtons) ...[
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton.primary(
                          text: 'Sign In',
                          width: 120.w,
                          onPressed: onSignIn,
                        ),
                        SizedBox(width: 16.w),
                        CustomButton.secondary(
                          text: 'Sign Up',
                          width: 120.w,
                          onPressed: onSignUp,
                        ),
                      ],
                    ),
                  ],
                  Spacer(flex: showButtons ? 2 : 4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
