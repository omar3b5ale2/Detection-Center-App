import 'package:flutter/material.dart';
import 'package:pyramakerz_assement/core/util/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.accent)
        .copyWith(surface: AppColors.background),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.accent,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.primary)
        .copyWith(surface: AppColors.backGroundBlack),
    // ... other theme properties
  );
}
