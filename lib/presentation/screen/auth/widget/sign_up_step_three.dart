import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_toggle_link.dart';

class SignUpStep3 extends StatefulWidget {
  final VoidCallback onSignUp;
  final VoidCallback onSignInTap;
  final bool isLoading;

  const SignUpStep3({
    super.key,
    required this.onSignUp,
    required this.onSignInTap,
    this.isLoading = false,
  });

  @override
  State<SignUpStep3> createState() => _SignUpStep3State();
}

class _SignUpStep3State extends State<SignUpStep3>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),

                  // Step title
                  Text(
                    'Security',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Create a strong password to protect your account',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // Form fields
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
                          errorText: 'Password is required'),
                      FormBuilderValidators.minLength(
                        6,
                        errorText: 'At least 6 characters',
                      ),
                    ],
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
                        errorText: 'Password confirmation is required',
                      ),
                      FormBuilderValidators.minLength(
                        6,
                        errorText: 'At least 6 characters',
                      ),
                      (value) {
                        final formState = FormBuilder.of(context);
                        final password =
                            formState?.fields['password']?.value;
                        if (value != password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Info tip
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 20.sp,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            'Use at least 6 characters with a mix of letters and numbers',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spacer pushes buttons to bottom when there's room
                  const Spacer(),
                  SizedBox(height: 24.h),

                  // Sign Up button
                  CustomButton.primary(
                    width: double.infinity,
                    text: 'Sign Up',
                    onPressed: widget.onSignUp,
                    isLoading: widget.isLoading,
                  ),
                  SizedBox(height: 16.h),
                  AuthToggleLink(
                    prompt: 'Already have an account? ',
                    linkText: 'Sign In',
                    onTap: widget.onSignInTap,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
