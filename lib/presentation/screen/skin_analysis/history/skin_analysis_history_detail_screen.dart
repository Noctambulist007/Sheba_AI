import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_ai/data/model/skin_analysis_record.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/widget/analysis_results_section.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class SkinAnalysisHistoryDetailScreen extends StatelessWidget {
  const SkinAnalysisHistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final record =
        ModalRoute.of(context)!.settings.arguments as SkinAnalysisRecord;
    final xFile =
        record.imagePath != null ? XFile(record.imagePath!) : null;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: 'Analysis Detail',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnalysisResultsSection(
              result: record.toResult(),
              selectedImage: xFile,
              onNewAnalysis: () => Navigator.pop(context),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
