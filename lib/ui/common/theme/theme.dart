import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
    primaryColor: Colors.grey[800],
    secondaryHeaderColor: Colors.orange[500]);

TextStyle titleStyle(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double titlefont = size.width / 11;
  return Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontSize: titlefont,
        color: theme.secondaryHeaderColor,
        fontFamily: "Lora",
      ) ??
      const TextStyle();
}

TextStyle titleStyleLarge(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double titleFontSize = size.width / 12;

  return GoogleFonts.lora().copyWith(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).secondaryHeaderColor,
  );
}

TextStyle titleStyleMedium(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double titleFontSize = size.width / 17;

  return GoogleFonts.lora().copyWith(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).secondaryHeaderColor,
  );
}

TextStyle titleStyleSmall(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titleFontSize = size.width / 30;
  return
    GoogleFonts.lora().copyWith(
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).secondaryHeaderColor,
    );
}

TextStyle textStyleText(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titleFontSize = size.width / 40;
  return GoogleFonts.lato().copyWith(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).secondaryHeaderColor,
  );
}




TextStyle? textStyleInput(BuildContext context, String inputText) {
  int baseFontSize = 20;
  double textFontSize =
      inputText.length > 20 ? baseFontSize - 1.5 : baseFontSize.toDouble();

  return GoogleFonts.lora().copyWith(
    fontSize: textFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).secondaryHeaderColor,
  );
}


