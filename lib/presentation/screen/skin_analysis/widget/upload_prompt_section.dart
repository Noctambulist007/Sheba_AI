import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

class UploadPromptSection extends StatelessWidget {
  final VoidCallback onTapUpload;

  const UploadPromptSection({super.key, required this.onTapUpload});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUploadArea(context),
        SizedBox(height: 16.h),
        _buildTipsCard(),
        SizedBox(height: 16.h),
        _buildDisclaimer(),
      ],
    );
  }

  Widget _buildUploadArea(BuildContext context) {
    return GestureDetector(
      onTap: onTapUpload,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.health_and_safety_rounded,
                    size: 56.sp,
                    color: AppColors.primary,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add_a_photo_rounded,
                      size: 20.sp,
                      color: AppColors.primaryGradient,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'Upload Skin Photo',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.grayscaleTextTitle,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Tap to take a photo or choose from gallery',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.grayscaleTextBody,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'AI-Powered Skin Analysis',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipsCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tips for Best Results',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.grayscaleTextTitle,
            ),
          ),
          SizedBox(height: 12.h),
          _TipItem(
            text: 'Ensure good lighting on the affected area',
            icon: Icons.wb_sunny_rounded,
          ),
          _TipItem(
            text: 'Take a close-up photo of the skin condition',
            icon: Icons.zoom_in_rounded,
          ),
          _TipItem(
            text: 'Include surrounding healthy skin for context',
            icon: Icons.crop_free_rounded,
          ),
          _TipItem(
            text: 'Avoid filters or image editing',
            icon: Icons.filter_none_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.warningSurfaceSubtitle,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.warningBorderLighter.withOpacity(0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 18.sp,
            color: AppColors.warningDark,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'This tool provides informational guidance only and is not a medical diagnosis. Always consult a healthcare professional.',
              style: TextStyle(
                fontSize: 11.sp,
                color: AppColors.warningDark,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TipItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const _TipItem({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(icon, size: 16.sp, color: AppColors.primary),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.grayscaleTextBody,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
