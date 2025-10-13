import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../theme/color.dart';

class CustomButton extends StatefulWidget {
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
    borderRadius = 24.0,
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
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  void didUpdateWidget(CustomButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Reset button when isLoading changes from true to false
    if (oldWidget.isLoading && !widget.isLoading) {
      _btnController.reset();
    }
  }

  void _handlePress() {
    if (widget.onPressed != null && !widget.isLoading) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50.h,
      child: RoundedLoadingButton(
        controller: _btnController,
        onPressed: widget.isLoading ? null : _handlePress,
        borderRadius: widget.borderRadius ?? 25.r,
        color: widget.gradient == null
            ? (widget.backgroundColor ?? theme.primaryColor)
            : Colors.transparent,
        successColor: Colors.green,
        errorColor: Colors.redAccent,
        loaderSize: 20.w,
        child: Container(
          decoration: BoxDecoration(
            gradient: widget.gradient,
            border: widget.borderColor != null
                ? Border.all(
                    color: widget.borderColor!,
                    width: widget.borderWidth ?? 1.5.w,
                  )
                : null,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 25.r),
          ),
          alignment: Alignment.center,
          padding:
              widget.padding ??
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[widget.icon!, SizedBox(width: 8.w)],
              Text(
                widget.text,
                style:
                    widget.textStyle ??
                    TextStyle(
                      fontSize: widget.fontSize ?? 16.sp,
                      color: widget.textColor ?? Colors.white,
                      fontWeight: widget.fontWeight ?? FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
