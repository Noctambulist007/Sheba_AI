import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/auth/state/register_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_header.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_toggle_link.dart';
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

    final firstName = _formKey.currentState?.fields['first_name']?.value ?? '';
    final lastName = _formKey.currentState?.fields['last_name']?.value ?? '';
    final username = _formKey.currentState?.fields['username']?.value ?? '';
    final address = _formKey.currentState?.fields['address']?.value ?? '';
    final email = _formKey.currentState?.fields['email']?.value ?? '';
    final phone = _formKey.currentState?.fields['phone']?.value;
    final password = _formKey.currentState?.fields['password']?.value ?? '';
    final confirmPassword =
        _formKey.currentState?.fields['confirm_password']?.value ?? '';

    await ref
        .read(registerNotifierProvider.notifier)
        .register(
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AuthHeader(title: "Sign Up to Sheba.AI"),
                SizedBox(height: 32.h),

                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
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
                        textInputAction: TextInputAction.next,
                        validators: [
                          FormBuilderValidators.required(
                            errorText: 'Username is required',
                          ),
                          FormBuilderValidators.minLength(
                            3,
                            errorText: 'At least 3 characters',
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      CustomFormField(
                        name: 'address',
                        labelText: 'Address',
                        hintText: '123 Main St, City, Country',
                        iconPath: 'assets/icons/ic-location.svg',
                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        validators: [
                          FormBuilderValidators.required(
                            errorText: 'Address is required',
                          ),
                          FormBuilderValidators.minLength(
                            5,
                            errorText: 'At least 5 characters',
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
                            errorText: 'Email is required',
                          ),
                          FormBuilderValidators.email(
                            errorText: 'Enter a valid email',
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

                SizedBox(height: 24.h),
                CustomButton.primary(
                  width: double.infinity,
                  text: "Sign Up",
                  onPressed: _handleSignUp,
                ),

                SizedBox(height: 24.h),

                // const AuthDivider(),
                // SizedBox(height: 24.h),
                // const SocialLoginSection(),
                // SizedBox(height: 24.h),
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
    );
  }
}
