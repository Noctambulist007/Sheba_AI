import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:sheba_ai/presentation/screen/prescription/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/prescription/state/prescription_ui_state.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/carousel_slider_section.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/how_sheba_ai_works.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/prescription_item.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/prescription_item_shimmer.dart';
import 'package:sheba_ai/presentation/screen/profile/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/profile/profile_screen.dart';
import 'package:sheba_ai/presentation/screen/profile/state/profile_ui_state.dart'
    hide LoadingState;
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class PrescriptionScreen extends ConsumerStatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  ConsumerState<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends ConsumerState<PrescriptionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onRefresh() async {
    final notifier = ref.read(prescriptionNotifierProvider.notifier);
    await notifier.fetchAllPrescriptions();
  }

  Future<void> _pickImage(ImageSource source) async {
    Navigator.pop(context);
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 70);

    if (pickedFile != null) {
      ref.read(selectedImageProvider.notifier).state = pickedFile;
    }
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryGradient],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_photo_alternate,
                  size: 40.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Upload Prescription',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grayscaleTextTitle,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Choose your preferred method',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grayscaleTextBody,
                ),
              ),
              SizedBox(height: 24.h),

              // Camera Option
              _buildSourceOption(
                icon: Icons.camera_alt_rounded,
                title: 'Take Photo',
                subtitle: 'Use your camera',
                iconColor: AppColors.primary,
                onTap: () => _pickImage(ImageSource.camera),
              ),

              SizedBox(height: 12.h),

              // Gallery Option
              _buildSourceOption(
                icon: Icons.photo_library_rounded,
                title: 'Choose from Gallery',
                subtitle: 'Select from your photos',
                iconColor: Colors.blue,
                onTap: () => _pickImage(ImageSource.gallery),
              ),

              SizedBox(height: 20.h),

              // Cancel Button
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 12.h,
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.grayscaleTextBody,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSourceOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: iconColor.withOpacity(0.3), width: 0.5),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, size: 32.sp, color: iconColor),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grayscaleTextTitle,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.grayscaleTextBody,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.sp,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }

  void _analyzePrescription() {
    final selectedImage = ref.read(selectedImageProvider);
    if (selectedImage == null) return;

    final notifier = ref.read(prescriptionNotifierProvider.notifier);
    notifier.createPrescriptionWithPath(selectedImage.path);
  }

  void _cancelUpload() {
    ref.read(selectedImageProvider.notifier).state = null;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(prescriptionNotifierProvider);
    final profileState = ref.watch(profileNotifierProvider);
    final selectedImage = ref.watch(selectedImageProvider);

    ref.listen<PrescriptionUiState>(prescriptionNotifierProvider, (
      previous,
      next,
    ) {
      next.maybeWhen(
        analyzeSuccess: (analyzePrescription) {
          ref.read(selectedImageProvider.notifier).state = null;
          ToastHelper.showSuccess(
            context,
            'Prescription analyzed successfully!',
          );
        },
        error: (message) {
          ToastHelper.showError(context, message);
        },
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: profileState.when(
          loading: () => 'Loading...',
          anonymous: () => 'Hi, Guest',
          success: (profile) => 'Hi, ${profile.username}',
          error: (message) => 'Error',
        ),
        customActions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: IconButton(
              onPressed: () {
                profileState.when(
                  loading: () {},
                  anonymous: () => Navigator.pushNamed(context, Routes.signIn),
                  success: (profile) {
                    Navigator.pushNamed(
                      context,
                      Routes.profile,
                      arguments: ProfileArgs(userProfile: profile),
                    );
                  },
                  error: (message) {
                    ToastHelper.showError(context, message);
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                );
              },
              icon: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.person, size: 24.w, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  // Carousel and How It Works Section
                  if (selectedImage == null)
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.2),
                          ),
                        ),
                        child: Column(
                          children: [
                            CarouselSliderSection(),
                            SizedBox(height: 16.h),
                            HowShebaAiWorks(),
                          ],
                        ),
                      ),
                    ),

                  SizedBox(height: selectedImage == null ? 8.h : 16.h),

                  // Upload/Preview Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.2),
                        ),
                      ),
                      child: selectedImage == null
                          ? _buildUploadPrompt()
                          : _buildImagePreview(selectedImage),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // My Prescriptions list
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'My Prescriptions',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.grayscaleTextTitle,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to see all
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryGradient,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 8.h),

                  state.maybeWhen(
                    initial: () => const SizedBox.shrink(),
                    loading: () => Padding(
                      padding: EdgeInsets.all(16.w),
                      child: ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            const PrescriptionItemShimmer(),
                      ),
                    ),
                    error: (message) => Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64.sp,
                              color: Colors.red,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Error: $message',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              onPressed: _onRefresh,
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    success: (prescriptions, isLoadingMore, hasMore) {
                      if (prescriptions.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            children: [
                              SizedBox(height: 50.h),
                              Icon(
                                Icons.receipt_long,
                                size: 64.sp,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'No prescriptions found.',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: prescriptions.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),

                              itemBuilder: (context, index) {
                                final item = prescriptions[index];
                                return PrescriptionItem(prescription: item);
                              },
                            ),
                            if (isLoadingMore)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: Center(
                                  child: SizedBox(
                                    width: 200.w,
                                    child: LinearProgressIndicator(
                                      color: AppColors.primary,
                                      backgroundColor: AppColors.colorWhite,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),

          // Processing Overlay with Lottie Animation
          if (state is LoadingState && selectedImage != null)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  padding: EdgeInsets.all(32.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        'assets/anims/scanner.json',
                        width: 200.w,
                        height: 200.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Analyzing Prescription...',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grayscaleTextTitle,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Please wait while we process your prescription with AI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.grayscaleTextBody,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          color: AppColors.primary,
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUploadPrompt() {
    return Column(
      children: [
        GestureDetector(
          onTap: _showImageSourceDialog,
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
                    Lottie.asset(
                      'assets/anims/safety.json',
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(8.w),
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
                          size: 24.sp,
                          color: AppColors.primaryGradient,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Upload Your Prescription',
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
                    'AI-Powered Analysis',
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
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.primary.withOpacity(0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Tips for Best Results',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayscaleTextTitle,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              _buildTipItem(
                'Ensure good lighting and avoid shadows',
                Icons.wb_sunny_rounded,
              ),
              _buildTipItem(
                'Keep the prescription flat and stable',
                Icons.straighten_rounded,
              ),
              _buildTipItem(
                'Make sure all text is clearly visible',
                Icons.visibility_rounded,
              ),
              _buildTipItem(
                'Capture the entire prescription',
                Icons.crop_free_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImagePreview(XFile image) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.file(
                  File(image.path),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, size: 16.sp, color: Colors.white),
                    SizedBox(width: 4.w),
                    Text(
                      'Ready',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: OutlinedButton.icon(
                onPressed: _cancelUpload,
                icon: const Icon(Icons.close_rounded),
                label: const Text('Cancel'),
                style: OutlinedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 12.sp),
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 0.5),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 2,
              child: OutlinedButton.icon(
                onPressed: _showImageSourceDialog,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Change'),
                style: OutlinedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 12.sp),
                  foregroundColor: AppColors.primary,
                  side: BorderSide(color: AppColors.primary, width: 0.5),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 3,
              child: ElevatedButton.icon(
                onPressed: _analyzePrescription,
                icon: Icon(Icons.auto_fix_high_rounded),
                label: const Text('Analyze Now'),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 12.sp),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  elevation: 0,
                  shadowColor: AppColors.primary.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTipItem(String text, IconData icon) {
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
