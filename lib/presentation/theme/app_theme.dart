import 'package:flutter/material.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:sheba_ai/presentation/theme/text_theme.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.colorBackground,
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: textTheme,
      fontFamily: 'SF Pro',
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.colorPrimary,
        onPrimary: AppColors.colorOnPrimary,
        secondary: AppColors.colorSecondary,
        onSecondary: AppColors.colorOnSecondary,
        surface: AppColors.colorSurface,
        onSurface: AppColors.colorOnSurface,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      textTheme: textTheme,
    );
  }
}
