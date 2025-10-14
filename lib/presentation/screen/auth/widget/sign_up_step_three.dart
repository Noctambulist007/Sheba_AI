import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';

class SignUpStep3 extends StatefulWidget {
  const SignUpStep3({super.key});

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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Security',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.grayscaleBorderDisabled,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Create a strong password to protect your account',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.grayscaleBorderDisabled.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 24.h),
          CustomFormField(
            name: 'password',
            labelText: 'Password',
            hintText: '*********',
            iconPath: 'assets/icons/ic-password.svg',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            validators: [
              FormBuilderValidators.required(errorText: 'Password is required'),
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
                final password = formState?.fields['password']?.value;
                if (value != password) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.grayscaleBorderDisabled.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20.sp,
                  color: AppColors.grayscaleBorderDisabled,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'Use at least 6 characters with a mix of letters and numbers',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.grayscaleBorderDisabled,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
