import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/state/skin_analysis_ui_state.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/widget/analysis_error_banner.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/widget/analysis_loading.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/widget/analysis_results_section.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/widget/image_preview_section.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/widget/image_source_dialog.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/widget/upload_prompt_section.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/toast_helper.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class SkinAnalysisScreen extends ConsumerStatefulWidget {
  const SkinAnalysisScreen({super.key});

  @override
  ConsumerState<SkinAnalysisScreen> createState() => _SkinAnalysisScreenState();
}

class _SkinAnalysisScreenState extends ConsumerState<SkinAnalysisScreen> {
  Future<void> _pickImage(ImageSource source) async {
    Navigator.pop(context);
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 70,
    );
    if (pickedFile != null) {
      ref.read(skinSelectedImageProvider.notifier).state = pickedFile;
      ref.read(skinAnalysisNotifierProvider.notifier).reset();
    }
  }

  void _showImageSourceDialog() {
    ImageSourceDialog.show(context, onPickImage: _pickImage);
  }

  void _analyzeImage() {
    final selectedImage = ref.read(skinSelectedImageProvider);
    if (selectedImage == null) return;
    ref.read(skinAnalysisNotifierProvider.notifier).analyzeSkin(
          imagePath: selectedImage.path,
        );
  }

  void _cancelUpload() {
    ref.read(skinSelectedImageProvider.notifier).state = null;
    ref.read(skinAnalysisNotifierProvider.notifier).reset();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(skinAnalysisNotifierProvider);
    final selectedImage = ref.watch(skinSelectedImageProvider);

    ref.listen<SkinAnalysisUiState>(skinAnalysisNotifierProvider,
        (previous, next) {
      if (next is SkinAnalysisError) {
        ToastHelper.showError(context, next.message);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomGradientAppBar(title: 'Skin Check'),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            if (state is! SkinAnalysisSuccess)
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.2),
                    ),
                  ),
                  child: selectedImage == null
                      ? UploadPromptSection(onTapUpload: _showImageSourceDialog)
                      : ImagePreviewSection(
                          image: selectedImage,
                          isLoading: state is SkinAnalysisLoading,
                          onCancel: _cancelUpload,
                          onChange: _showImageSourceDialog,
                          onAnalyze: _analyzeImage,
                        ),
                ),
              ),

            if (state is SkinAnalysisLoading) const AnalysisLoading(),

            if (state is SkinAnalysisError && selectedImage != null)
              AnalysisErrorBanner(onRetry: _analyzeImage),

            if (state case SkinAnalysisSuccess(:final result))
              AnalysisResultsSection(
                result: result,
                selectedImage: selectedImage,
                onNewAnalysis: _cancelUpload,
              ),

            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
