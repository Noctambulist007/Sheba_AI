import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/auth/state/login_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_divider.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_header.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_toggle_link.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/social_login_section.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';

import '../../util/routes.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _handleSignIn() async {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final username = _formKey.currentState?.fields['username']?.value;
    final password = _formKey.currentState?.fields['password']?.value;

    await ref
        .read(loginNotifierProvider.notifier)
        .login(username: username, password: password);

    final state = ref.read(loginNotifierProvider);
    if (state is SuccessState) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.main, (route) => false);
    } else if (state is ErrorState) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AuthHeader(title: "Sign In to Sheba.AI"),
            SizedBox(height: 32.h),

            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    name: 'username',
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    iconPath: 'assets/icons/ic-user.svg',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validators: [
                      FormBuilderValidators.required(
                        errorText: 'Username is required',
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomFormField(
                    name: 'password',
                    labelText: 'Password',
                    hintText: '*********',
                    iconPath: 'assets/icons/ic-password.svg',
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    validators: [
                      FormBuilderValidators.required(
                        errorText: 'Password is required',
                      ),
                      FormBuilderValidators.minLength(
                        6,
                        errorText: 'At least 6 characters',
                      ),
                    ],
                    onSubmitted: _handleSignIn,
                  ),
                ],
              ),
            ),

            SizedBox(height: 2.h),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.otpSend);
                },
                child: Text(
                  "Forgot Password?",
                  style: AppTextStyles.labelL6Regular.copyWith(
                    color: AppColors.colorPrimary,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12.h),
            CustomButton.primary(
              width: double.infinity,
              text: "Sign In",
              onPressed: _handleSignIn,
              isLoading: ref.watch(loginNotifierProvider) is LoadingState,
            ),

            SizedBox(height: 24.h),

            // const AuthDivider(),
            // SizedBox(height: 24.h),
            // const SocialLoginSection(),
            // SizedBox(height: 24.h),
            AuthToggleLink(
              prompt: "Don't have an account? ",
              linkText: "Sign Up",
              onTap: () {
                Navigator.pushNamed(context, Routes.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
