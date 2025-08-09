import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/presentation/theme/text_styles.dart';

class CustomGradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<Color> gradientColors;
  final String? svgPath;
  final Widget? leading;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onCartPressed;
  final bool showSearch;
  final bool showCart;
  final List<Widget>? customActions;

  const CustomGradientAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.gradientColors = const [Color(0xFF0D47A1), Color(0xFF01579B)],
    this.svgPath,
    this.leading,
    this.onSearchPressed,
    this.onCartPressed,
    this.showSearch = true,
    this.showCart = true,
    this.customActions,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient Background
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

        // Transparent AppBar with content
        AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: leading,
          title: Row(
            children: [
              if (svgPath != null) SvgPicture.asset(svgPath!, height: 24.h),
              if (svgPath != null) SizedBox(width: 8.w),
              Text(
                title,
                style: titleStyle ??
                    AppTextStyles.labelL4Semibold.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          actions: customActions ??
              [
                if (showSearch)
                  IconButton(
                   icon: SvgPicture.asset(
                      'assets/icons/ic-search.svg',
                      color: Colors.white,
                      height: 24.h,
                    ),
                    onPressed: onSearchPressed,
                  ),
                if (showCart)
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/ic-cart.svg',
                      color: Colors.white,
                      height: 24.h,
                    ),
                    onPressed: onCartPressed,
                  ),
              ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
