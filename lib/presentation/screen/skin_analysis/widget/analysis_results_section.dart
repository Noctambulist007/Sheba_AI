import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_result.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

class AnalysisResultsSection extends StatelessWidget {
  final SkinAnalysisResult result;
  final XFile? selectedImage;
  final VoidCallback onNewAnalysis;

  const AnalysisResultsSection({
    super.key,
    required this.result,
    required this.selectedImage,
    required this.onNewAnalysis,
  });

  @override
  Widget build(BuildContext context) {
    final sections = _parseSections(result.analysis);

    return Column(
      children: [
        if (selectedImage != null)
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                    File(selectedImage!.path),
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Analysis Complete',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grayscaleTextTitle,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      if (result.severity != null)
                        _SeverityBadge(severity: result.severity!),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onNewAnalysis,
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: AppColors.primary,
                  ),
                  tooltip: 'New Analysis',
                ),
              ],
            ),
          ),
        SizedBox(height: 12.h),
        ...sections.map((section) => _SectionCard(section: section)),
      ],
    );
  }

  List<_AnalysisSection> _parseSections(String text) {
    final sections = <_AnalysisSection>[];
    final sectionPattern = RegExp(r'\*\*([^*]+)\*\*\s*:?\s*');
    final matches = sectionPattern.allMatches(text).toList();

    if (matches.isEmpty) {
      sections.add(_AnalysisSection(
        title: 'Analysis',
        content: text.trim(),
        icon: Icons.medical_information_rounded,
        iconColor: AppColors.primary,
      ));
      return sections;
    }

    for (int i = 0; i < matches.length; i++) {
      final title = matches[i].group(1)?.trim() ?? '';
      final startIdx = matches[i].end;
      final endIdx =
          i + 1 < matches.length ? matches[i + 1].start : text.length;
      final content = text.substring(startIdx, endIdx).trim();

      if (content.isEmpty) continue;

      final meta = _getSectionMeta(title);
      sections.add(_AnalysisSection(
        title: title,
        content: content,
        icon: meta.icon,
        iconColor: meta.color,
      ));
    }

    return sections;
  }

  _SectionMeta _getSectionMeta(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('disclaimer')) {
      return _SectionMeta(Icons.gavel_rounded, AppColors.warningDark);
    }
    if (lower.contains('summary')) {
      return _SectionMeta(Icons.summarize_rounded, AppColors.info);
    }
    if (lower.contains('diagnosis')) {
      return _SectionMeta(Icons.biotech_rounded, AppColors.primary);
    }
    if (lower.contains('severity')) {
      return _SectionMeta(Icons.speed_rounded, AppColors.warning);
    }
    if (lower.contains('first-aid') || lower.contains('urgent')) {
      return _SectionMeta(Icons.local_hospital_rounded, AppColors.error);
    }
    if (lower.contains('home remed') || lower.contains('over-the-counter')) {
      return _SectionMeta(Icons.medication_rounded, AppColors.success);
    }
    if (lower.contains('warning')) {
      return _SectionMeta(Icons.warning_amber_rounded, AppColors.errorDark);
    }
    if (lower.contains('follow-up')) {
      return _SectionMeta(Icons.calendar_month_rounded, AppColors.secondary);
    }
    if (lower.contains('additional') || lower.contains('recommendation')) {
      return _SectionMeta(Icons.tips_and_updates_rounded, AppColors.accent);
    }
    if (lower.contains('confidence') || lower.contains('uncertainty')) {
      return _SectionMeta(Icons.analytics_rounded, AppColors.infoDark);
    }
    if (lower.contains('source')) {
      return _SectionMeta(Icons.menu_book_rounded, AppColors.gray600);
    }
    return _SectionMeta(
      Icons.medical_information_rounded,
      AppColors.primary,
    );
  }
}

class _SeverityBadge extends StatelessWidget {
  final String severity;

  const _SeverityBadge({required this.severity});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    final lower = severity.toLowerCase();
    if (lower.contains('mild')) {
      bgColor = AppColors.successContainer;
      textColor = AppColors.successDark;
    } else if (lower.contains('severe')) {
      bgColor = AppColors.errorContainer;
      textColor = AppColors.errorDark;
    } else {
      bgColor = AppColors.warningContainer;
      textColor = AppColors.warningDark;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        severity,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final _AnalysisSection section;

  const _SectionCard({required this.section});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.gray200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (section.title.isNotEmpty)
              Row(
                children: [
                  Icon(
                    section.icon,
                    size: 18.sp,
                    color: section.iconColor,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      section.title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grayscaleTextTitle,
                      ),
                    ),
                  ),
                ],
              ),
            if (section.title.isNotEmpty) SizedBox(height: 10.h),
            Text(
              section.content,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.grayscaleTextBody,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnalysisSection {
  final String title;
  final String content;
  final IconData icon;
  final Color iconColor;

  _AnalysisSection({
    required this.title,
    required this.content,
    required this.icon,
    required this.iconColor,
  });
}

class _SectionMeta {
  final IconData icon;
  final Color color;
  _SectionMeta(this.icon, this.color);
}
