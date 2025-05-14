import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/calculated_font_size.dart';

ThemeData theme = ThemeData(
  primaryColor: const Color(0xFFFEF3E2), // Couleur primaire
  scaffoldBackgroundColor: const Color(
      0xFFFEF3E2), // Couleur de fond par défaut (utilise primaryColor ou autre)
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFBEC6A0),
    onPrimary: Color(0xFF708871),
    secondary: Color(0xFF606676),
    onSecondary: Color(0xFF000000),
    error: Color(0xFFFF0000),
    onError: Color(0xFFFF0000),
    surface: Color(  0xFFFEF3E2),
    onSurface: Color(0xFF606676),
  ),
);


// Style pour les titres avec la police Amable
TextStyle titleStyle(BuildContext context) {

  return TextStyle(
    fontFamily: 'Roboto',
    color: theme.colorScheme.onSurface,
      decoration: TextDecoration.none
  ).copyWith();
}

TextStyle textStyleText(BuildContext context) {
  return TextStyle(
    fontFamily: 'Lato',
    color: theme.colorScheme.onSecondary,
    decoration: TextDecoration.none
  ).copyWith();
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

// Style pour le texte avec la police Autography
TextStyle textStylePara(BuildContext context) {
  return textStyleText(context).copyWith(
    fontSize: calculateFontSize(context, ratio: 85),
    height:1.5

  );

}

TextStyle textStyleTextAccueil(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double textFontSize = size.width / 55;
  return  GoogleFonts.montserrat().copyWith(
    fontSize: textFontSize,
    color: Theme.of(context).colorScheme.secondary,
    decoration: TextDecoration.none,
  );
}

TextStyle textStyleTextBulle(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double textFontSize = size.width / 88;
  return
    GoogleFonts.montserrat().copyWith(
      fontSize: textFontSize,
      color: Theme.of(context).colorScheme.secondary,
      decoration: TextDecoration.none,
    );
}

TextStyle? textStyleInput(BuildContext context, String inputText) {
  int baseFontSize = 15;
  double textFontSize =
  inputText.length > 20 ? baseFontSize - 1.2 : baseFontSize.toDouble();

  return  GoogleFonts.montserrat().copyWith(
    fontSize: textFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
    decoration: TextDecoration.none,
  );
}