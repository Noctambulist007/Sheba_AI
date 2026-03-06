import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/domain/model/reminder/reminder.dart';
import 'package:sheba_ai/presentation/screen/reminder/notifier/reminder_notifier.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/widget/custom_gradient_app_bar.dart';

class AddEditReminderScreen extends ConsumerStatefulWidget {
  final Reminder? reminder;

  const AddEditReminderScreen({super.key, this.reminder});

  @override
  ConsumerState<AddEditReminderScreen> createState() =>
      _AddEditReminderScreenState();
}

class _AddEditReminderScreenState extends ConsumerState<AddEditReminderScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _medicineNameController;
  late TextEditingController _dosageController;
  late TimeOfDay _selectedTime;
  late String _selectedType;
  late String _selectedFrequency;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  final List<_MedicineTypeOption> _typeOptions = [
    _MedicineTypeOption('Pill', Icons.medication, const Color(0xFF43A047)),
    _MedicineTypeOption('Syrup', Icons.local_drink, const Color(0xFF1976D2)),
    _MedicineTypeOption('Injection', Icons.vaccines, const Color(0xFFE53935)),
    _MedicineTypeOption('Drops', Icons.water_drop, const Color(0xFF00ACC1)),
    _MedicineTypeOption('Other', Icons.medical_services, const Color(0xFF8E24AA)),
  ];

  final List<String> _frequencyOptions = ['Daily', 'Weekly', 'Monthly'];

  @override
  void initState() {
    super.initState();
    _medicineNameController =
        TextEditingController(text: widget.reminder?.medicineName ?? '');
    _dosageController =
        TextEditingController(text: widget.reminder?.dosage ?? '');
    _selectedType = widget.reminder?.type ?? 'Pill';
    _selectedFrequency = widget.reminder?.frequency ?? 'Daily';
    _selectedTime = widget.reminder != null
        ? TimeOfDay.fromDateTime(widget.reminder!.time)
        : TimeOfDay.now();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    _dosageController.dispose();
    _animController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.grayscaleTextBody,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveReminder() {
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      final scheduledTime = DateTime(
        now.year,
        now.month,
        now.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      final effectiveTime = scheduledTime.isBefore(now)
          ? scheduledTime.add(const Duration(days: 1))
          : scheduledTime;

      final reminder = Reminder(
        id: widget.reminder?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        medicineName: _medicineNameController.text,
        dosage: _dosageController.text,
        type: _selectedType,
        frequency: _selectedFrequency,
        time: effectiveTime,
        isEnabled: widget.reminder?.isEnabled ?? true,
      );

      if (widget.reminder != null) {
        ref.read(reminderNotifierProvider.notifier).updateReminder(reminder);
      } else {
        ref.read(reminderNotifierProvider.notifier).addReminder(reminder);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomGradientAppBar(
        title: widget.reminder != null ? 'Edit Reminder' : 'Add Reminder',
      ),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeroTimePicker(),
                SizedBox(height: 24.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionLabel('Medicine Name'),
                      SizedBox(height: 8.h),
                      _buildStyledTextField(
                        controller: _medicineNameController,
                        hint: 'e.g. Paracetamol',
                        icon: Icons.medication_outlined,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter medicine name' : null,
                      ),
                      SizedBox(height: 20.h),

                      _buildSectionLabel('Dosage'),
                      SizedBox(height: 8.h),
                      _buildStyledTextField(
                        controller: _dosageController,
                        hint: 'e.g. 500mg',
                        icon: Icons.science_outlined,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter dosage' : null,
                      ),
                      SizedBox(height: 24.h),

                      _buildSectionLabel('Medicine Type'),
                      SizedBox(height: 12.h),
                      _buildTypeSelector(),
                      SizedBox(height: 24.h),

                      _buildSectionLabel('Frequency'),
                      SizedBox(height: 12.h),
                      _buildFrequencySelector(),
                      SizedBox(height: 36.h),

                      _buildGradientSaveButton(),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroTimePicker() {
    final hour = _selectedTime.hourOfPeriod == 0 ? 12 : _selectedTime.hourOfPeriod;
    final minute = _selectedTime.minute.toString().padLeft(2, '0');
    final period = _selectedTime.period == DayPeriod.am ? 'AM' : 'PM';

    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 20.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF025036), Color(0xFF2E7A45)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.r),
            bottomRight: Radius.circular(32.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.access_time_rounded,
                size: 36.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$hour:$minute',
                  style: TextStyle(
                    fontSize: 52.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(width: 6.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Text(
                    period,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.touch_app_rounded,
                      size: 14.sp, color: Colors.white70),
                  SizedBox(width: 4.w),
                  Text(
                    'Tap to change time',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.grayscaleTextBody,
        letterSpacing: 0.3,
      ),
    );
  }

  Widget _buildStyledTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 15.sp,
        color: AppColors.grayscaleTextBody,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.grayscaleTextSubtitle.withOpacity(0.6),
          fontSize: 14.sp,
        ),
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 12.w, right: 8.w),
          child: Icon(icon, color: AppColors.primary, size: 22.sp),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 40.w),
        filled: true,
        fillColor: AppColors.grayscaleSurfaceGrayBackground,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(
            color: AppColors.grayscaleBorderDarker,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: _typeOptions.map((option) {
        final isSelected = _selectedType == option.label;
        return GestureDetector(
          onTap: () => setState(() => _selectedType = option.label),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? option.color.withOpacity(0.12)
                  : AppColors.grayscaleSurfaceGrayBackground,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? option.color : AppColors.grayscaleBorderDarker,
                width: isSelected ? 1.8 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: option.color.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  option.icon,
                  size: 18.sp,
                  color: isSelected
                      ? option.color
                      : AppColors.grayscaleTextSubtitle,
                ),
                SizedBox(width: 6.w),
                Text(
                  option.label,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected
                        ? option.color
                        : AppColors.grayscaleTextSubtitle,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFrequencySelector() {
    return Row(
      children: _frequencyOptions.map((freq) {
        final isSelected = _selectedFrequency == freq;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedFrequency = freq),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFF025036), Color(0xFF2E7A45)],
                      )
                    : null,
                color: isSelected ? null : AppColors.grayscaleSurfaceGrayBackground,
                borderRadius: BorderRadius.circular(12.r),
                border: isSelected
                    ? null
                    : Border.all(color: AppColors.grayscaleBorderDarker),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  freq,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? Colors.white
                        : AppColors.grayscaleTextSubtitle,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGradientSaveButton() {
    return GestureDetector(
      onTap: _saveReminder,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF025036), Color(0xFF2E7A45)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.reminder != null
                  ? Icons.check_circle_outline
                  : Icons.alarm_add_rounded,
              color: Colors.white,
              size: 22.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              widget.reminder != null ? 'Update Reminder' : 'Save Reminder',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MedicineTypeOption {
  final String label;
  final IconData icon;
  final Color color;

  const _MedicineTypeOption(this.label, this.icon, this.color);
}
