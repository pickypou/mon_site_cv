import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';

import 'core/utils/calculated_font_size.dart';

@singleton
class ThemeService extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

// Custom Colors
class AppColors {
  // Light Theme
  static const Color lightBackground = Color(0xFFFEF3E2);
  static const Color lightPrimary = Color(0xFFBEC6A0);
  static const Color lightOnPrimary = Color(0xFF708871);
  static const Color lightSecondary = Color(0xFF606676);
  
  // Dark Theme
  static const Color darkBackground = Color(0xFF1A1C18); // Deep charcoal with slight green tint
  static const Color darkSurface = Color(0xFF2D2F29);
  static const Color darkPrimary = Color(0xFFD2EBAF); // Lighter moss green for contrast
  static const Color darkOnPrimary = Color(0xFF2C341D);
  static const Color darkSecondary = Color(0xFFBEC6A0);
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightBackground,
  scaffoldBackgroundColor: AppColors.lightBackground,
  colorScheme: const ColorScheme.light(
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    secondary: AppColors.lightSecondary,
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    surface: AppColors.lightBackground,
    onSurface: AppColors.lightSecondary,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkBackground,
  scaffoldBackgroundColor: AppColors.darkBackground,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    secondary: AppColors.darkSecondary,
    onSecondary: Color(0xFF1A1C18),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    surface: AppColors.darkSurface,
    onSurface: Color(0xFFE2E3D8),
  ),
);

// Backward compatibility for old "theme" variable
ThemeData theme = lightTheme;

// Typography remains similar but uses theme-agnostic colors where possible
TextStyle titleStyle(BuildContext context) {
  return TextStyle(
    fontFamily: 'Roboto',
    color: Theme.of(context).colorScheme.onSurface,
    decoration: TextDecoration.none
  );
}

TextStyle textStyleText(BuildContext context) {
  return TextStyle(
    fontFamily: 'Lato',
    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.9),
    decoration: TextDecoration.none
  );
}

TextStyle titleStyleLarge(BuildContext context) {
  return titleStyle(context).copyWith(
    fontSize: calculateFontSize(context, ratio: 30),
    fontWeight: FontWeight.w700
  );
}

TextStyle titleStyleMedium(BuildContext context) {
  return titleStyle(context).copyWith(
    fontSize: calculateFontSize(context, ratio: 45),
    fontWeight: FontWeight.w500
  );
}

TextStyle titleStyleSmall(BuildContext context) {
  return titleStyle(context).copyWith(
    fontSize: calculateFontSize(context, ratio: 70),
    fontWeight: FontWeight.w500
  );
}

TextStyle textStylePara(BuildContext context) {
  return textStyleText(context).copyWith(
    fontSize: calculateFontSize(context, ratio: 85),
    height: 1.5
  );
}

TextStyle textStyleTextAccueil(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double textFontSize = size.width / 55;
  return GoogleFonts.montserrat().copyWith(
    fontSize: textFontSize,
    color: Theme.of(context).colorScheme.secondary,
    decoration: TextDecoration.none,
  );
}

TextStyle textStyleTextBulle(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double textFontSize = size.width / 88;
  return GoogleFonts.montserrat().copyWith(
    fontSize: textFontSize,
    color: Theme.of(context).colorScheme.secondary,
    decoration: TextDecoration.none,
  );
}

TextStyle? textStyleInput(BuildContext context, String inputText) {
  int baseFontSize = 15;
  double textFontSize = inputText.length > 20 ? baseFontSize - 1.2 : baseFontSize.toDouble();

  return GoogleFonts.montserrat().copyWith(
    fontSize: textFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
    decoration: TextDecoration.none,
  );
}