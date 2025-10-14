import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';

class SignUpStep1 extends StatefulWidget {
  const SignUpStep1({super.key});

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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.grayscaleBorderDisabled,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Let\'s get to know you better',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.grayscaleBorderDisabled.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 24.h),
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
              FormBuilderValidators.required(errorText: 'Username is required'),
              FormBuilderValidators.minLength(
                3,
                errorText: 'At least 3 characters',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
