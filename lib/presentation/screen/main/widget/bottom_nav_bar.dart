import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/domain/model/nav_item/navigation_item.dart';

import '../../../theme/color.dart';
import '../../../theme/text_theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    var items = [
      NavigationItem(
        icon: "assets/icons/prescription-light-icon.png",
        label: "Prescription",
      ),
      NavigationItem(
        icon: "assets/icons/store-light-icon.png",
        label: "Store",
      ),
      NavigationItem(
        icon: "assets/icons/chat-light-icon.png",
        label: "Chat",
      ),
      NavigationItem(
        icon: "assets/icons/reminder-light-icon.png",
        label: "Reminder",
      ),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            iconTheme: WidgetStateProperty.resolveWith((states) {
              return IconThemeData(
                color: states.contains(WidgetState.selected)
                    ? AppColors.colorPrimary
                    : AppColors.grayscaleBorderDisabled,
                size: 24.r,
              );
            }), //

            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              return textTheme.bodyLarge?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: states.contains(WidgetState.selected)
                    ? AppColors.grayscaleTextTitle
                    : AppColors.grayscaleBorderDisabled,
              );
            }),
          ), //

          child: NavigationBar(
            height: 60.h,
            selectedIndex: selectedIndex,
            onDestinationSelected: onItemSelected,
            backgroundColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: items.map((item) {
              return NavigationDestination(
                label: item.label,
                icon: Image.asset(
                  item.icon,
                  width: 24.w,
                  height: 24.h,
                  color: selectedIndex == items.indexOf(item)
                      ? AppColors.colorPrimary
                      : AppColors.grayscaleBorderDisabled,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

