import 'package:flutter/material.dart';
import 'package:todo_app/theme/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Times New Roman',
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        shape: CircleBorder(),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Times New Roman',
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
            color: AppColors.secondary,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            color: AppColors.secondary,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            color: AppColors.secondary,
            fontSize: 8,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            color: AppColors.black,
            fontSize: 24,
            fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal),
        bodySmall: TextStyle(
            color: AppColors.black, fontSize: 8, fontWeight: FontWeight.normal),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(AppColors.black),
        fillColor: WidgetStateProperty.all(Color(0x00FFFFFF)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
