import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sheba_ai/presentation/screen/auth/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/auth/state/login_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/state/verify_email_ui_state.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_header.dart';
import 'package:sheba_ai/presentation/screen/auth/widget/auth_toggle_link.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_button.dart';
import 'package:sheba_ai/presentation/widget/custom_form_field.dart';
import 'package:sheba_ai/data/repository/source/local/identity_local_data_source.dart';
import 'package:sheba_ai/injection.dart';

import '../../util/routes.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(loginNotifierProvider.notifier).reset();
      ref.read(verifyEmailNotifierProvider.notifier).reset();
    });
  }

  void _handleSignIn() async {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    final username = _formKey.currentState?.fields['username']?.value;
    final password = _formKey.currentState?.fields['password']?.value;

    await ref
        .read(loginNotifierProvider.notifier)
        .login(username: username, password: password);

    final state = ref.read(loginNotifierProvider);
    if (state is SuccessState) {
      await ref
          .read(verifyEmailNotifierProvider.notifier)
          .checkVerification(username);

      final verifyState = ref.read(verifyEmailNotifierProvider);
      verifyState.when(
        initial: () {},
        loading: () {},
        verified: () {
          ref
              .read(authNotifierProvider.notifier)
              .updateAuthState(state.tokenData);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.main, (route) => false);
        },
        unverified: () {
          getIt<IdentityLocalDataSource>().clearTokens();
          ToastHelper.showError(context,
              'Please verify your email before signing in. Check your inbox.');
        },
        error: (message) {
          getIt<IdentityLocalDataSource>().clearTokens();
          ToastHelper.showError(context, message);
        },
      );
    } else if (state is ErrorState) {
      final verifyState = ref.read(verifyEmailNotifierProvider);
      verifyState.maybeWhen(
        unverified: () {
          getIt<IdentityLocalDataSource>().clearTokens();
          ToastHelper.showError(context,
              'Please verify your email before signing in. Check your inbox.');
        },
        orElse: () {
          ToastHelper.showError(context, state.message);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 32.h),

                        const AuthHeader(title: "Sign In to Sheba.AI"),
                        SizedBox(height: 32.h),

                        FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: [
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
                                onSubmitted: _handleSignIn,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24.h),

                        CustomButton.primary(
                          width: double.infinity,
                          text: "Sign In",
                          onPressed: _handleSignIn,
                          isLoading: ref
                              .watch(loginNotifierProvider)
                              .maybeWhen(
                                loading: () => true,
                                error: (_) => false,
                                orElse: () => false,
                              ),
                        ),

                        SizedBox(height: 24.h),

                        AuthToggleLink(
                          prompt: "Don't have an account? ",
                          linkText: "Sign Up",
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signUp);
                          },
                        ),

                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
