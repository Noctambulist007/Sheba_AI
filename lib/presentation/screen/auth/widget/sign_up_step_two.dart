import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_toggle_link.dart';

class SignUpStep2 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onSignInTap;

  const SignUpStep2({
    super.key,
    required this.onNext,
    required this.onSignInTap,
  });

  @override
  State<SignUpStep2> createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2>
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
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'How can we reach you?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // Form fields
                  CustomFormField(
                    name: 'phone',
                    labelText: 'Phone Number',
                    hintText: '01XXXXXXXXX',
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
                    name: 'email',
                    labelText: 'Email',
                    hintText: 'user@example.com',
                    iconPath: 'assets/icons/ic-email.svg',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Email is required'),
                      FormBuilderValidators.email(
                          errorText: 'Enter a valid email'),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomFormField(
                    name: 'address',
                    labelText: 'Address',
                    hintText: '123 Main St, City, Country',
                    iconPath: 'assets/icons/ic-location.svg',
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.done,
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Address is required'),
                      FormBuilderValidators.minLength(
                        5,
                        errorText: 'At least 5 characters',
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
