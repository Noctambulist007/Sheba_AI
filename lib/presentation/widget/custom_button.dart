import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/color.dart';

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
  }) {
    return CustomButton(
      key: key,
      text: text,
      borderRadius: borderRadius ?? 24.r,
      gradient: const LinearGradient(
        colors: [Color(0xFF0D47A1), Color(0xFF007BDC)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      textColor: Colors.white,
      onPressed: onPressed,
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

    Widget buttonChild = isLoading
        ? SizedBox(
            width: 20.w,
            height: 20.h,
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              valueColor: AlwaysStoppedAnimation<Color>(
                loadingColor ?? textColor ?? Colors.white,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, SizedBox(width: 8.w)],
              Text(
                text,
                style:
                    textStyle ??
                    TextStyle(
                      fontSize: fontSize ?? 16.sp,
                      fontWeight: fontWeight ?? FontWeight.w600,
                    ),
              ),
            ],
          );

    return SizedBox(
      width: width,
      height: height ?? 50.h,
      child: gradient != null
          ? Container(
              decoration: BoxDecoration(
                gradient: isLoading ? null : gradient,
                color: isLoading ? Colors.grey.withOpacity(0.6) : null,
                borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
                border: borderColor != null
                    ? Border.all(
                        color: borderColor!,
                        width: borderWidth ?? 1.5.w,
                      )
                    : null,
              ),
              child: ElevatedButton(
                onPressed: isLoading ? null : onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: textColor ?? Colors.white,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  padding:
                      padding ??
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
                  ),
                ),
                child: buttonChild,
              ),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? theme.primaryColor,
                foregroundColor: textColor ?? Colors.white,
                elevation: 0,
                padding:
                    padding ??
                    EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
                  side: borderColor != null
                      ? BorderSide(
                          color: borderColor!,
                          width: borderWidth ?? 1.5.w,
                        )
                      : BorderSide.none,
                ),
                disabledBackgroundColor: backgroundColor?.withOpacity(0.6),
                disabledForegroundColor: textColor?.withOpacity(0.6),
              ),
              child: buttonChild,
            ),
    );
  }
}
