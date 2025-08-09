import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_divider.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_header.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_toggle_link.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/social_login_section.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _handleSignUp() async {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final phone = _formKey.currentState?.fields['phone']?.value;
    final password = _formKey.currentState?.fields['password']?.value;
    final confirmPassword =
        _formKey.currentState?.fields['confirm_password']?.value;
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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //   top: 16.h,
            //   right: 16.w,
            //   child: IconButton(
            //     icon: Icon(
            //       Icons.close,
            //       color: AppColors.grayscaleBorderDisabled,
            //       size: 24.sp,
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.all(20.h),
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 40.h,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AuthHeader(title: "Sign Up For An Account"),
                          SizedBox(height: 32.h),

                          FormBuilder(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomFormField(
                                  name: 'phone',
                                  labelText: 'Phone Number',
                                  hintText: '+8801XXXXXXXXX',
                                  iconPath: 'assets/icons/ic-phone.svg',
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  validators: [
                                    FormBuilderValidators.required(
                                      errorText: 'Phone number is required',
                                    ),
                                    FormBuilderValidators.phoneNumber(
                                      errorText: 'Enter a valid phone number',
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
                                  textInputAction: TextInputAction.next,
                                  validators: [
                                    FormBuilderValidators.required(
                                      errorText: 'Password is required',
                                    ),
                                    FormBuilderValidators.minLength(
                                      6,
                                      errorText: 'At least 6 characters',
                                    ),
                                  ],
                                  onSubmitted: _handleSignUp,
                                ),
                                SizedBox(height: 16.h),

                                CustomFormField(
                                  name: 'confirm_password',
                                  labelText: 'Confirm Password',
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
                                  onSubmitted: _handleSignUp,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 16.h),
                          CustomButton.primary(
                            width: double.infinity,
                            borderRadius: 6.r,
                            text: "Sign Up",
                            onPressed: _handleSignUp,
                          ),

                          SizedBox(height: 24.h),
                          const AuthDivider(),
                          SizedBox(height: 24.h),
                          const SocialLoginSection(),
                          SizedBox(height: 24.h),

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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
