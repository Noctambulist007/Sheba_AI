import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';

class SignUpStep2 extends StatefulWidget {
  const SignUpStep2({super.key});

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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.grayscaleBorderDisabled,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'How can we reach you?',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.grayscaleBorderDisabled.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 24.h),
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
              FormBuilderValidators.required(errorText: 'Email is required'),
              FormBuilderValidators.email(errorText: 'Enter a valid email'),
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
              FormBuilderValidators.required(errorText: 'Address is required'),
              FormBuilderValidators.minLength(
                5,
                errorText: 'At least 5 characters',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
