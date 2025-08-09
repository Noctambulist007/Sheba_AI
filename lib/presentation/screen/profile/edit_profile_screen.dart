import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _handleProfileUpdate() async {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final phone = _formKey.currentState?.fields['phone']?.value;
    final password = _formKey.currentState?.fields['password']?.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.colorWhite,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.grayscaleIconDefault,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Edit Profile', style: AppTextStyles.labelL4Semibold),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A70D1), Color(0xFF454A9F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          child: Icon(
                            Icons.person,
                            size: 50.sp,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 16.r,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.grayscaleIconDefault,
                                size: 20,
                              ),
                              onPressed: () {
                                // Add upload functionality here
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Upload profile photo',
                      style: AppTextStyles.labelL5Regular.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.colorWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: AppTextStyles.labelL4Regular,
                    ),
                    SizedBox(height: 16.h),
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomFormField(
                                  name: 'first_name',
                                  labelText: 'First Name',
                                  hintText: 'Enter your first name',
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
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: CustomFormField(
                                  name: 'last_name',
                                  labelText: 'Last Name',
                                  hintText: 'Enter your last name',
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
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          CustomFormField(
                            name: 'email',
                            labelText: 'Email Address',
                            hintText: 'Enter your email',
                            iconPath: 'assets/icons/ic-email.svg',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validators: [
                              FormBuilderValidators.required(
                                errorText: 'Email is required',
                              ),
                              FormBuilderValidators.email(
                                errorText: 'Enter a valid email address',
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
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
                          // date of birth, gender
                          Row(
                            children: [
                              Expanded(
                                child: CustomFormField(
                                  name: 'date_of_birth',
                                  labelText: 'Date of Birth',
                                  hintText: 'Select your date of birth',
                                  iconPath: 'assets/icons/ic-calender.svg',
                                  keyboardType: TextInputType.datetime,
                                  textInputAction: TextInputAction.next,
                                  validators: [
                                    FormBuilderValidators.required(
                                      errorText: 'Date of birth is required',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: CustomFormField(
                                  name: 'gender',
                                  labelText: 'Gender',
                                  hintText: 'Select gender',
                                  iconPath: 'assets/icons/ic-user.svg',
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  validators: [
                                    FormBuilderValidators.required(
                                      errorText: 'Gender is required',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.h),
        child: CustomButton.primary(
          width: double.infinity,
          borderRadius: 6.r,
          text: "Save",
          onPressed: _handleProfileUpdate,
        ),
      ),
    );
  }
}
