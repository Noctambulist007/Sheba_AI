import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
            padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: AppColors.gray200.withValues(alpha: 0.5)),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.file(
                        File(selectedImage!.path),
                        width: 64.w,
                        height: 64.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Analysis Complete',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grayscaleTextTitle,
                            letterSpacing: -0.3,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        if (result.severity != null)
                          _SeverityBadge(severity: result.severity!),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: onNewAnalysis,
                      icon: Icon(
                        Icons.refresh_rounded,
                        color: AppColors.primary,
                        size: 22.sp,
                      ),
                      tooltip: 'New Analysis',
                    ),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(height: 16.h),
        ...sections.map((section) => _SectionCard(section: section)),
        SizedBox(height: 16.h),
      ],
    );
  }

  List<_AnalysisSection> _parseSections(String text) {
    final sections = <_AnalysisSection>[];
    final sectionPattern = RegExp(
      r'^\s*\*\*([^*]+)\*\*\s*:?\s*',
      multiLine: true,
    );
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
    if (lower.contains('action') || lower.contains('immediate')) {
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
    if (lower.contains('confidence') || lower.contains('uncertainty') || lower.contains('likely')) {
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
    IconData iconData;
    final lower = severity.toLowerCase();
    
    if (lower.contains('mild') || lower.contains('normal') || lower.contains('clear')) {
      bgColor = AppColors.successContainer;
      textColor = AppColors.successDark;
      iconData = Icons.check_circle_rounded;
    } else if (lower.contains('severe') || lower.contains('high') || lower.contains('critical')) {
      bgColor = AppColors.errorContainer;
      textColor = AppColors.errorDark;
      iconData = Icons.error_rounded;
    } else {
      bgColor = AppColors.warningContainer;
      textColor = AppColors.warningDark;
      iconData = Icons.warning_rounded;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: textColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 14.sp,
            color: textColor,
          ),
          SizedBox(width: 4.w),
          Text(
            severity.toUpperCase(),
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: textColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: section.iconColor.withValues(alpha: 0.15),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: section.iconColor.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (section.title.isNotEmpty)
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: section.iconColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      section.icon,
                      size: 22.sp,
                      color: section.iconColor,
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Text(
                      section.title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grayscaleTextTitle,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            if (section.title.isNotEmpty) ...[
              SizedBox(height: 14.h),
              Divider(
                color: AppColors.gray200.withValues(alpha: 0.6),
                height: 1,
              ),
              SizedBox(height: 14.h),
            ],
            MarkdownBody(
              data: section.content,
              styleSheet: MarkdownStyleSheet(
                p: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grayscaleTextBody.withValues(alpha: 0.9),
                  height: 1.65,
                  fontWeight: FontWeight.w400,
                ),
                h1: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.grayscaleTextTitle),
                h2: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.grayscaleTextTitle),
                h3: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: AppColors.grayscaleTextTitle),
                h4: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.grayscaleTextTitle),
                h5: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.grayscaleTextTitle),
                h6: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.grayscaleTextTitle),
                listBullet: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                ),
                strong: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.grayscaleTextTitle,
                ),
                em: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.grayscaleTextBody,
                ),
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
