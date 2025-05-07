import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.peach,
  primaryColor: AppColors.slate,
  colorScheme: const ColorScheme.light(
    primary: AppColors.slate,
    onPrimary: Colors.white,
    secondary: AppColors.sage,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: AppColors.peach,
    onBackground: AppColors.slate,
    surface: AppColors.white,
    onSurface: AppColors.black,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: AppColors.slate,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: AppColors.slate,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Lato',
      fontSize: 16,
      color: AppColors.slate,
    ),
  ),
);
