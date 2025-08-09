import 'package:flutter/material.dart';
import 'package:sheba_ai/presentation/screen/profile/widget/profile_widget.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Profile',
        showSearch: false,
        showCart: false,

      ),
      body: const SingleChildScrollView(
        child: ProfileWidget(
          name: 'Ariful Islam',
          email: 'arifulislam@email.com',
          phone: '+880 1234 567890',
          services: 12,
          points: 1200,
          referrals: 5,
          location: 'sylhet, bangladesh',
        ),
      ),
    );
  }
}
