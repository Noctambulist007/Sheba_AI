import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/domain/model/reminder/reminder.dart';
import 'package:sheba_ai/presentation/screen/reminder/add_edit_reminder_screen.dart';
import 'package:sheba_ai/presentation/screen/reminder/notifier/reminder_notifier.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';
import 'package:intl/intl.dart';

class ReminderScreen extends ConsumerWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(reminderNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomGradientAppBar(title: 'Medicine Reminders'),
      body: reminders.isEmpty ? _buildEmptyState() : _buildReminderList(context, ref, reminders),
      floatingActionButton: _buildGradientFAB(context),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.alarm_off_rounded,
                size: 56.sp,
                color: AppColors.primary.withOpacity(0.4),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'No Reminders Yet',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.grayscaleTextBody,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Stay on track with your medications.\nTap + to set your first reminder.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.grayscaleTextSubtitle,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReminderList(
      BuildContext context, WidgetRef ref, List<Reminder> reminders) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 12.h),
          child: Row(
            children: [
              Text(
                'Your Reminders',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grayscaleTextBody,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF025036), Color(0xFF2E7A45)],
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '${reminders.length}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final reminder = reminders[index];
              return _buildReminderCard(context, ref, reminder);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildReminderCard(
      BuildContext context, WidgetRef ref, Reminder reminder) {
    final typeData = _getTypeVisual(reminder.type);
    final timeStr = DateFormat.jm().format(reminder.time);

    return Dismissible(
      key: Key(reminder.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            title: const Text('Delete Reminder'),
            content: Text(
                'Remove "${reminder.medicineName}" reminder?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: TextButton.styleFrom(
                    foregroundColor: AppColors.error),
                child: const Text('Delete'),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) {
        ref
            .read(reminderNotifierProvider.notifier)
            .deleteReminder(reminder.id);
      },
      background: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(16.r),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.delete_outline_rounded,
                color: Colors.white, size: 28),
            SizedBox(height: 4.h),
            Text(
              'Delete',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddEditReminderScreen(reminder: reminder),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 5.w,
                  decoration: BoxDecoration(
                    color: reminder.isEnabled
                        ? typeData.color
                        : AppColors.grayscaleTextSubtitle.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                    ),
                  ),
                ),

                // Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 14.w, vertical: 14.h),
                    child: Row(
                      children: [
                        // Time Column
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: reminder.isEnabled
                                    ? typeData.color.withOpacity(0.1)
                                    : AppColors.grayscaleSurfaceGrayBackground,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                typeData.icon,
                                size: 24.sp,
                                color: reminder.isEnabled
                                    ? typeData.color
                                    : AppColors.grayscaleTextSubtitle,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              timeStr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                color: reminder.isEnabled
                                    ? AppColors.primary
                                    : AppColors.grayscaleTextSubtitle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 14.w),

                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                reminder.medicineName,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: reminder.isEnabled
                                      ? AppColors.grayscaleTextBody
                                      : AppColors.grayscaleTextSubtitle,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                reminder.dosage,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.grayscaleTextSubtitle,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  _buildInfoBadge(
                                    reminder.type,
                                    typeData.color,
                                    reminder.isEnabled,
                                  ),
                                  SizedBox(width: 6.w),
                                  _buildInfoBadge(
                                    reminder.frequency,
                                    AppColors.primary,
                                    reminder.isEnabled,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Switch.adaptive(
                          value: reminder.isEnabled,
                          activeColor: AppColors.primary,
                          activeTrackColor:
                              AppColors.primary.withOpacity(0.3),
                          inactiveThumbColor: AppColors.grayscaleTextSubtitle,
                          inactiveTrackColor:
                              AppColors.grayscaleBorderDarker,
                          onChanged: (value) {
                            ref
                                .read(reminderNotifierProvider.notifier)
                                .toggleReminder(reminder);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBadge(String text, Color color, bool isEnabled) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: isEnabled ? color.withOpacity(0.1) : AppColors.grayscaleSurfaceGrayBackground,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: isEnabled ? color : AppColors.grayscaleTextSubtitle,
        ),
      ),
    );
  }

  Widget _buildGradientFAB(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddEditReminderScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF025036), Color(0xFF2E7A45)],
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(Icons.alarm_add_rounded, color: Colors.white, size: 22.sp),
      ),
    );
  }

  _TypeVisual _getTypeVisual(String type) {
    switch (type.toLowerCase()) {
      case 'pill':
        return _TypeVisual(Icons.medication, const Color(0xFF43A047));
      case 'syrup':
        return _TypeVisual(Icons.local_drink, const Color(0xFF1976D2));
      case 'injection':
        return _TypeVisual(Icons.vaccines, const Color(0xFFE53935));
      case 'drops':
        return _TypeVisual(Icons.water_drop, const Color(0xFF00ACC1));
      default:
        return _TypeVisual(Icons.medical_services, const Color(0xFF8E24AA));
    }
  }
}

class _TypeVisual {
  final IconData icon;
  final Color color;
  const _TypeVisual(this.icon, this.color);
}
