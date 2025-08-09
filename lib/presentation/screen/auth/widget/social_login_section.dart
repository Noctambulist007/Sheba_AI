import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/custom_icon_button.dart';

class SocialLoginSection extends ConsumerStatefulWidget {
  const SocialLoginSection({super.key});

  @override
  ConsumerState<SocialLoginSection> createState() => _SocialLoginSectionState();
}

class _SocialLoginSectionState extends ConsumerState<SocialLoginSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomIconButton(
            icon: SvgPicture.asset(
              'assets/icons/ic-google.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
            //
            onPressed: () {
            },
          ),
        ), //
        SizedBox(width: 16.w), //

        Expanded(
          child: CustomIconButton(
            icon: SvgPicture.asset(
              'assets/icons/ic-facebook.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
            //
            onPressed: () {
            },
          ),
        ), //
        SizedBox(width: 16.w), //

        Expanded(
          child: CustomIconButton(
            icon: SvgPicture.asset(
              'assets/icons/ic-apple.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
            //
            onPressed: () {
            },
          ),
        ), //
      ],
    );
  }
}
