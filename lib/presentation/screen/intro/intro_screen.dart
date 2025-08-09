import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/screen/intro/widget/intro_page_body.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/routes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: AppColors.background,
      pageBackgroundColor: AppColors.background,
      totalPage: 3,
      speed: 1.8,
      centerBackground: true,
      finishButtonText: 'Done',
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: AppColors.primaryColour,
      ),
      skipTextButton: const Text(
        'Skip',
        style: TextStyle(
          color: AppColors.primaryColour,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Text(
        'Next',
        style: TextStyle(
          color: AppColors.primaryColour,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.pushReplacementNamed(context, Routes.signIn);
      },
      onFinish: () {
        Navigator.pushReplacementNamed(context, Routes.signIn);
      },
      controllerColor: AppColors.primaryColour,
      background: [
        Image.asset(
          'assets/images/intro-first.png',
          height: 200.h,
          width: 200.w,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/intro-second.png',
          height: 200.h,
          width: 200.w,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/intro-third.png',
          height: 200.h,
          width: 200.w,
          fit: BoxFit.contain,
        ),
      ],
      pageBodies: [
        IntroPageBody(
          title: 'Welcome to Sheba.AI',
          subtitle: 'Your one-stop solution for all healthcare needs.',
        ),
        IntroPageBody(
          title: 'All in one App',
          subtitle:
              'Book appointments, order medicines, and consult doctors online.',
        ),
        IntroPageBody(
          title: 'Get Started Now',
          subtitle: 'Join us today and experience the future of healthcare.',
          showButtons: true,
          onSignIn: () =>
              Navigator.pushReplacementNamed(context, Routes.signIn),
          onSignUp: () =>
              Navigator.pushReplacementNamed(context, Routes.signUp),
        ),
      ],
    );
  }
}
