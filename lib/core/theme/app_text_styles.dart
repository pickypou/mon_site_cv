import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/calculated_font_size.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle titleLarge(BuildContext context) =>
      GoogleFonts.roboto().copyWith(
        fontSize: MediaQuery.sizeOf(context).width / 15,
        fontWeight: FontWeight.bold,
        color: AppColors.slate,
        decoration: TextDecoration.none,
      );

  static TextStyle titleMedium(BuildContext context) =>
      GoogleFonts.roboto().copyWith(
        fontSize: MediaQuery.sizeOf(context).width / 25,
        fontWeight: FontWeight.bold,
        color: AppColors.slate,
        decoration: TextDecoration.none,
      );

  static TextStyle titleSmall(BuildContext context) =>
      GoogleFonts.roboto().copyWith(
        fontSize: MediaQuery.sizeOf(context).width / 30,
        fontWeight: FontWeight.bold,
        color: AppColors.slate,
        decoration: TextDecoration.none,
      );

  static TextStyle bodyText(BuildContext context) =>
      GoogleFonts.lato().copyWith(
        fontSize: calculateFontSize(context, ratio: 70),
        color: AppColors.slate,
        decoration: TextDecoration.none,
      );

  static TextStyle homeText(BuildContext context) =>
      GoogleFonts.lato().copyWith(
        fontSize: MediaQuery.sizeOf(context).width / 80,
        color: AppColors.slate,
        decoration: TextDecoration.none,
      );
}
