import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/domain/model/identity/profile.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/profile/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/profile/state/profile_ui_state.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProfileArgs {
  final Profile userProfile;

  ProfileArgs({required this.userProfile});
}

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as ProfileArgs;
    final userProfile = args.userProfile;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Profile',
        customActions: [
          // logout
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.main,
                (route) => false,
              );
            },
          ),
        ],
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
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
                    colors: [Color(0xFF025036), Color(0xFF056F38)],
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
                          backgroundImage:
                              AssetImage('assets/logo/app-logo.png')
                                  as ImageProvider,
                        ),
                        // Positioned(
                        //   bottom: 0,
                        //   right: 0,
                        //   child: CircleAvatar(
                        //     radius: 16.r,
                        //     backgroundColor: Colors.white,
                        //     child: IconButton(
                        //       icon: const Icon(
                        //         Icons.camera_alt_outlined,
                        //         color: AppColors.colorPrimary,
                        //         size: 20,
                        //       ),
                        //       onPressed: () {},
                        //     ),
                        //   ),
                        // ),
                      ],
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
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomFormField(
                            initialValue:
                                '${userProfile.firstName} ${userProfile.lastName}',
                            name: 'full_name',
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                            iconPath: 'assets/icons/ic-user.svg',
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validators: [
                              FormBuilderValidators.required(
                                errorText: 'Name is required',
                              ),
                              FormBuilderValidators.minLength(
                                3,
                                errorText: 'At least 3 characters',
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          CustomFormField(
                            initialValue: userProfile.username,
                            name: 'user_name',
                            labelText: 'User Name',
                            hintText: 'Enter your User name',
                            iconPath: 'assets/icons/ic-user.svg',
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            readOnly: true,
                            validators: [
                              FormBuilderValidators.required(
                                errorText: 'User is required',
                              ),
                              FormBuilderValidators.minLength(
                                3,
                                errorText: 'At least 3 characters',
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          CustomFormField(
                            initialValue: userProfile.email,
                            name: 'email',
                            labelText: 'Email Address',
                            hintText: 'Enter your email',
                            iconPath: 'assets/icons/ic-email.svg',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            readOnly: true,
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
                            initialValue: userProfile.phone,
                            name: 'phone',
                            labelText: 'Phone Number',
                            hintText: '01XXXXXXXXX',
                            iconPath: 'assets/icons/ic-phone.svg',
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16.h),
                          CustomFormField(
                            initialValue: userProfile.address,
                            name: 'address',
                            labelText: 'Address',
                            hintText: 'Enter your address',
                            iconPath: 'assets/icons/ic-location.svg',
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: CustomButton.primary(
            width: double.infinity,
            text: "Save",
            isLoading: ref
                .watch(profileNotifierProvider)
                .maybeWhen(
                  loading: () => true,
                  error: (_) => false,
                  orElse: () => false,
                ),
            onPressed: () => _handleProfileUpdate(context, ref),
            textStyle: AppTextStyles.labelL3Regular.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _handleProfileUpdate(BuildContext context, WidgetRef ref) async {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final formData = _formKey.currentState!.value;

    final fullName = formData['full_name'] as String;
    final nameParts = fullName.trim().split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts[0] : '';
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    final phone = formData['phone'] as String?;
    final address = formData['address'] as String?;

    ref
        .read(profileNotifierProvider.notifier)
        .updateProfile(firstName, lastName, phone, address);

    final profileState = ref.read(profileNotifierProvider);
    profileState.maybeWhen(

      success: (profile) {
        // ToastHelper.showSuccess(context, "Profile updated successfully");
        ref.read(profileNotifierProvider.notifier).fetchProfile();
      },
      error: (message) {
        ToastHelper.showError(context, message);
      },
      orElse: () {},
    );
  }
}
