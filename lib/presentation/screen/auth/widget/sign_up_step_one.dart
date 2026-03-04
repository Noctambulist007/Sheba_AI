import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_toggle_link.dart';

class SignUpStep1 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onSignInTap;

  const SignUpStep1({
    super.key,
    required this.onNext,
    required this.onSignInTap,
  });

  @override
  State<SignUpStep1> createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1>
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
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Let\'s get to know you better',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // Form fields
                  CustomFormField(
                    name: 'first_name',
                    labelText: 'First Name',
                    hintText: 'John',
                    iconPath: 'assets/icons/ic-user.svg',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validators: [
                      FormBuilderValidators.required(
                        errorText: 'First name is required',
                      ),
                      FormBuilderValidators.minLength(
                        2,
                        errorText: 'At least 2 characters',
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomFormField(
                    name: 'last_name',
                    labelText: 'Last Name',
                    hintText: 'Doe',
                    iconPath: 'assets/icons/ic-user.svg',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validators: [
                      FormBuilderValidators.required(
                        errorText: 'Last name is required',
                      ),
                      FormBuilderValidators.minLength(
                        2,
                        errorText: 'At least 2 characters',
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomFormField(
                    name: 'username',
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    iconPath: 'assets/icons/ic-user.svg',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Username is required'),
                      FormBuilderValidators.minLength(
                        3,
                        errorText: 'At least 3 characters',
                      ),
                    ],
                  ),

                  // Spacer pushes buttons to bottom when there's room
                  const Spacer(),
                  SizedBox(height: 24.h),

                  // Next button
                  CustomButton.primary(
                    width: double.infinity,
                    text: 'Next',
                    onPressed: widget.onNext,
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
