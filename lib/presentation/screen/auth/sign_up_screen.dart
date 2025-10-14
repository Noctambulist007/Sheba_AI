import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/auth/state/register_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_header.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_toggle_link.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/sign_up_step_one.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/sign_up_step_three.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/sign_up_step_two.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/step_progress_indicator.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      if (_validateCurrentPage()) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else {
      _handleSignUp();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool _validateCurrentPage() {
    final formState = _formKey.currentState;
    if (formState == null) return false;

    List<String> fieldsToValidate = [];

    switch (_currentPage) {
      case 0:
        fieldsToValidate = ['first_name', 'last_name', 'username'];
        break;
      case 1:
        fieldsToValidate = ['phone', 'email', 'address'];
        break;
      case 2:
        fieldsToValidate = ['password', 'confirm_password'];
        break;
    }

    bool isValid = true;
    for (String fieldName in fieldsToValidate) {
      final field = formState.fields[fieldName];
      if (field != null) {
        field.validate();
        if (!field.isValid) {
          isValid = false;
        }
      }
    }

    return isValid;
  }

  void _handleSignUp() async {
    final formState = _formKey.currentState;
    if (formState == null) return;

    if (!formState.saveAndValidate()) {
      return;
    }

    final fields = formState.value;
    final firstName = fields['first_name'] as String? ?? '';
    final lastName = fields['last_name'] as String? ?? '';
    final username = fields['username'] as String? ?? '';
    final address = fields['address'] as String? ?? '';
    final email = fields['email'] as String? ?? '';
    final phone = fields['phone'] as String? ?? '';
    final password = fields['password'] as String? ?? '';
    final confirmPassword = fields['confirm_password'] as String? ?? '';

    await ref.read(registerNotifierProvider.notifier).register(
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          address: address,
          username: username,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        );

    final state = ref.read(registerNotifierProvider);
    if (state is SuccessState) {
      Navigator.pushReplacementNamed(context, Routes.signIn);
    } else if (state is ErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.grayscaleBorderDisabled,
            size: 24.sp,
          ),
          onPressed: () {
            if (_currentPage > 0) {
              _previousPage();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const AuthHeader(title: "Sign Up to Sheba.AI"),
            ),
            SizedBox(height: 24.h),

            // Progress Indicator
            StepProgressIndicator(
              currentStep: _currentPage,
              totalSteps: 3,
            ),

            SizedBox(height: 24.h),

            Expanded(
              child: FormBuilder(
                key: _formKey,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    SignUpStep1(),
                    SignUpStep2(),
                    SignUpStep3(),
                  ],
                ),
              ),
            ),

            // Navigation Buttons
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  CustomButton.primary(
                    width: double.infinity,
                    text: _currentPage == 2 ? "Sign Up" : "Next",
                    onPressed: _nextPage,
                    isLoading: ref.watch(registerNotifierProvider).maybeWhen(
                      loading: () => true,
                      error: (_) => false,
                      orElse: () => false,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AuthToggleLink(
                    prompt: "Already have an account? ",
                    linkText: "Sign In",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.signIn);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
