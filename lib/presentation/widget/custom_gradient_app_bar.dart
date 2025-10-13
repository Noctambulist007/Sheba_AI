import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';

class CustomGradientAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final dynamic title; // can be String or Widget
  final bool? centerTitle;
  final TextStyle? titleStyle;
  final List<Color> gradientColors;
  final String? svgPath;
  final Widget? leading;
  final IconButton? lateIconButton;
  final bool showSearch;
  final bool showCart;
  final List<Widget>? customActions;
  final bool showDrawerIcon;

  const CustomGradientAppBar({
    super.key,
    required this.title,
    this.centerTitle,
    this.titleStyle,
    this.gradientColors = const [Color(0xFF025036), Color(0xFF056F38)],
    this.svgPath,
    this.leading,
    this.lateIconButton,
    this.showSearch = true,
    this.showCart = true,
    this.customActions,
    this.showDrawerIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget;

    if (title is String) {
      titleWidget = Text(
        title as String,
        style:
            titleStyle ??
            AppTextStyles.labelL4Semibold.copyWith(color: Colors.white),
      );
    } else if (title is Widget) {
      titleWidget = title as Widget;
    } else {
      titleWidget = const SizedBox.shrink();
    }

    return Stack(
      children: [
        Container(
          height: preferredSize.height + MediaQuery.of(context).padding.top,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading:
              leading ??
              (showDrawerIcon
                  ? IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    )
                  : null),
          centerTitle: centerTitle,
          title: Row(
            children: [
              if (svgPath != null) SvgPicture.asset(svgPath!, height: 24.h),
              if (svgPath != null) SizedBox(width: 8.w),
              titleWidget,
              if (lateIconButton != null) ...[
                SizedBox(width: 8.w),
                lateIconButton!,
              ],
            ],
          ),
          actions: customActions,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
