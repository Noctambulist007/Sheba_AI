import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color(0xFFEAEAEA),
            thickness: 1.w,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          'Or Continue with',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorTextGreyDark,
                fontSize: 12.sp,
                height: 14.sp / 12.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.sp,
              ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Divider(
            color: const Color(0xFFEAEAEA),
            thickness: 1.w,
          ),
        ),
      ],
    ); //
  }
}
