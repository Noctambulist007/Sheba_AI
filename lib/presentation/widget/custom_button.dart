import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool isLoading;
  final Color? loadingColor;
  final double? elevation;
  final TextStyle? textStyle;
  final Gradient? gradient;

  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.onPressed,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.icon,
    this.isLoading = false,
    this.loadingColor,
    this.elevation,
    this.textStyle,
    this.gradient,
  });

  factory CustomButton.primary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? width,
    double? height,
    Widget? icon,
    double? borderRadius,
    bool isLoading = false,
    List<Color>? gradientColors,
    TextStyle? textStyle,
  }) {
    return CustomButton(
      key: key,
      text: text,
      borderRadius: borderRadius ?? 25.r,
      gradient: LinearGradient(
        colors: gradientColors ?? [Color(0xFF025036), Color(0xFF056F38)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
      textColor: Colors.white,
      onPressed: onPressed,
      textStyle: textStyle,
      width: width,
      height: height,
      icon: icon,
      isLoading: isLoading,
    );
  }

  factory CustomButton.secondary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? width,
    double? height,
    Widget? icon,
    bool isLoading = false,
    double borderRadius = 24.0,
  }) {
    return CustomButton(
      key: key,
      text: text,
      backgroundColor: Colors.transparent,
      textColor: AppColors.primaryColour,
      borderColor: AppColors.primaryColour,
      onPressed: onPressed,
      width: width,
      height: height,
      icon: icon,
      isLoading: isLoading,
      borderRadius: borderRadius,
    );
  }

  factory CustomButton.outlined({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    Color? borderColor,
    Color? textColor,
    double? width,
    double? height,
    Widget? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      key: key,
      text: text,
      backgroundColor: Colors.transparent,
      textColor: textColor ?? Colors.black87,
      borderColor: borderColor ?? Colors.grey,
      onPressed: onPressed,
      width: width,
      height: height,
      icon: icon,
      isLoading: isLoading,
    );
  }

  factory CustomButton.danger({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double? width,
    double? height,
    Widget? icon,
    bool isLoading = false,
  }) {
    return CustomButton(
      key: key,
      text: text,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      onPressed: onPressed,
      width: width,
      height: height,
      icon: icon,
      isLoading: isLoading,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: gradient == null
              ? (backgroundColor ?? theme.primaryColor)
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
            side: borderColor != null
                ? BorderSide(
              color: borderColor!,
              width: borderWidth ?? 1.5.w,
            )
                : BorderSide.none,
          ),
          elevation: elevation ?? 0,
          padding: EdgeInsets.zero,
        ),
        onPressed: isLoading ? null : onPressed,
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: isLoading
                ? SizedBox(
              width: 22.w,
              height: 22.w,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  loadingColor ?? Colors.white,
                ),
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  icon!,
                  SizedBox(width: 8.w),
                ],
                Text(
                  text,
                  style: textStyle ??
                      TextStyle(
                        fontSize: fontSize ?? 16.sp,
                        color: textColor ?? Colors.white,
                        fontWeight: fontWeight ?? FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
