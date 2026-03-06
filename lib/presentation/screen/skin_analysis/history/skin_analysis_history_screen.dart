import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_record.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/history/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/history/state/skin_analysis_history_ui_state.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/history/widget/skin_analysis_history_item.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/util/routes.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class SkinAnalysisHistoryScreen extends ConsumerStatefulWidget {
  const SkinAnalysisHistoryScreen({super.key});

  @override
  ConsumerState<SkinAnalysisHistoryScreen> createState() =>
      _SkinAnalysisHistoryScreenState();
}

class _SkinAnalysisHistoryScreenState
    extends ConsumerState<SkinAnalysisHistoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(skinAnalysisHistoryNotifierProvider.notifier).loadHistory(),
    );
  }

  void _onDelete(String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Record'),
        content: const Text('Remove this skin analysis from history?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      ref
          .read(skinAnalysisHistoryNotifierProvider.notifier)
          .deleteRecord(id);
    }
  }

  void _onTap(SkinAnalysisRecord record) {
    Navigator.pushNamed(
      context,
      Routes.skinAnalysisHistoryDetail,
      arguments: record,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(skinAnalysisHistoryNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomGradientAppBar(title: 'Skin Check History', leading: BackButton(
        color: AppColors.colorWhite,
      )),
      body: switch (state) {
        SkinAnalysisHistoryLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        SkinAnalysisHistoryError(:final message) => Center(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ),
        SkinAnalysisHistoryLoaded(:final records) when records.isEmpty =>
          _EmptyHistory(),
        SkinAnalysisHistoryLoaded(:final records) => ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return SkinAnalysisHistoryItem(
                record: record,
                onTap: () => _onTap(record),
                onDelete: () => _onDelete(record.id),
              );
            },
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _EmptyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_rounded,
            size: 64.sp,
            color: AppColors.gray300,
          ),
          SizedBox(height: 16.h),
          Text(
            'No analyses yet',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.grayscaleTextTitle,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Your past skin checks will appear here',
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.gray500,
            ),
          ),
        ],
      ),
    );
  }
}
