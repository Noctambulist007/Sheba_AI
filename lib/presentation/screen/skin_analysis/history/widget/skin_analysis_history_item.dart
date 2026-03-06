import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_record.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

class SkinAnalysisHistoryItem extends StatelessWidget {
  final SkinAnalysisRecord record;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const SkinAnalysisHistoryItem({
    super.key,
    required this.record,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.gray200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildThumbnail(),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (record.summary != null)
                    Text(
                      record.summary!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayscaleTextTitle,
                        height: 1.4,
                      ),
                    ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      if (record.severity != null) ...[
                        _SeverityChip(severity: record.severity!),
                        SizedBox(width: 8.w),
                      ],
                      Text(
                        _formatDate(record.analyzedAt),
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.gray500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(
                Icons.delete_outline_rounded,
                size: 20.sp,
                color: AppColors.gray400,
              ),
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    final path = record.imagePath;
    if (path != null && File(path).existsSync()) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.file(
          File(path),
          width: 56.w,
          height: 56.w,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      width: 56.w,
      height: 56.w,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(
        Icons.image_not_supported_outlined,
        size: 24.sp,
        color: AppColors.primary,
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}

class _SeverityChip extends StatelessWidget {
  final String severity;
  const _SeverityChip({required this.severity});

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
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        severity,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
