import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';
import 'package:sheba_ai/presentation/util/routes.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final int services;
  final int points;
  final int referrals;
  final String location;

  const ProfileWidget({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.services,
    required this.points,
    required this.referrals,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Header
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          margin: EdgeInsets.all(16.h),
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6A70D1), Color(0xFF454A9F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage('assets/logo/app-logo.png'),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppTextStyles.labelL3Semibold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          email,
                          style: AppTextStyles.labelL6Regular.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          phone,
                          style: AppTextStyles.labelL6Regular.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.editProfile);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/ic-edit.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('Services', services.toString()),
                  _buildStat(
                    'Points',
                    '${(points / 1000).toStringAsFixed(1)}k',
                  ),
                  _buildStat('Referrals', referrals.toString()),
                ],
              ),
            ],
          ),
        ),

        // // Menu items
        // _buildMenuItem(Icons.history, 'Service History',() {
        //   Navigator.pushNamed(context, Routes.serviceHistory);
        // }, '$services services', ),
        // _buildMenuItem(Icons.bookmark, 'Booking History', () {
        //   Navigator.pushNamed(context, Routes.bookingHistory);
        // }, '$services services'),
        // _buildMenuItem(Icons.location_on, 'Saved Location', () {
        //   Navigator.pushNamed(context, Routes.location);
        // }, location),
        // _buildMenuItem(Icons.security, 'Privacy & Security', () {
        //   Navigator.pushNamed(context, Routes.serviceHistory);
        // },),
        // _buildMenuItem(Icons.settings, 'App Settings', () {
        //   Navigator.pushNamed(context, Routes.serviceHistory);
        // },),
        // _buildMenuItem(Icons.help_outline, 'Help & Support', () {
        //   Navigator.pushNamed(context, Routes.serviceHistory);
        // },),
        // _buildMenuItem(Icons.description_outlined, 'Terms & Conditions', () {
        //   Navigator.pushNamed(context, Routes.serviceHistory);
        // },),
        // _buildMenuItem(Icons.logout, 'Log out', () {
        //   Navigator.pushNamed(context, Routes.serviceHistory);
        // },),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.labelL5Semibold.copyWith(color: Colors.white),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppTextStyles.labelL6Regular.copyWith(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, [String? subtitle]) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grayscaleBorderDisabled.withOpacity(0.3),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: AppColors.colorPrimary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                padding: EdgeInsets.all(6.r),
                child: Icon(icon, color: AppColors.colorPrimary),
              ),
              title: Text(
                title,
                style: AppTextStyles.labelL5Medium.copyWith(
                  color: AppColors.grayscaleTextBody,
                ),
              ),
              subtitle: subtitle != null && subtitle.isNotEmpty
                  ? Text(
                      subtitle,
                      style: AppTextStyles.labelL6Regular.copyWith(
                        color: AppColors.grayscaleTextBody.withOpacity(0.7),
                      ),
                    )
                  : null,
              trailing: const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.grayscaleBorderDisabled,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
