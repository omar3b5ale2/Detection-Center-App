import 'package:flutter/material.dart';
import 'package:pyramakerz_assement/core/util/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColorLight: AppColors.primary,
    primaryColorDark: AppColors.accent,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      color: AppColors.lightBlueGray,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textColorLight),
      bodyMedium: TextStyle(color: AppColors.textColorLight),
      titleLarge: TextStyle(color: AppColors.textColorLight),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.accent,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColorLight: AppColors.primary,
    primaryColorDark: AppColors.accent,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      color: AppColors.accent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textColorDark),
      bodyMedium: TextStyle(color: AppColors.textColorDark),
      titleLarge: TextStyle(color: AppColors.accent),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary, // Matches purple primary color
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
  );
}
