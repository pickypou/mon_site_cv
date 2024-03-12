import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    primaryColor: Colors.grey[800],
    secondaryHeaderColor: Colors.orange[500]);

TextStyle titleStyle(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titlefont = size.width / 11;
  return Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontSize: titlefont,
        color: theme.secondaryHeaderColor,
        fontFamily: "Lora",
      ) ??
      const TextStyle();
}

TextStyle titleStyleMedium(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titlefont = size.width / 12;
  return Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontSize: titlefont,
        color: theme.secondaryHeaderColor,
        fontFamily: "lora".toUpperCase(),
      ) ??
      const TextStyle();
}

TextStyle titleStyleSmall(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titlefont = size.width / 30;
  return Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: titlefont,
            color: theme.secondaryHeaderColor,
            fontFamily: "lato",
          ) ??
      const TextStyle();
}

TextStyle textStyleText(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titlefont = size.width / 30;
  return Theme.of(context).textTheme.headlineLarge?.copyWith(
    fontSize: titlefont,
    color: theme.secondaryHeaderColor,
    fontFamily: "lato",
  ) ??
      const TextStyle();
}




TextStyle? textStyleInput(BuildContext context, String inputText) {
  int baseFontSize = 20;
  double textFontSize =
      inputText.length > 20 ? baseFontSize - 1.5 : baseFontSize.toDouble();

  return Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: textFontSize,
            color: theme.secondaryHeaderColor,
            fontFamily: "lato",
            // Ajoute d'autres propriétés de style si nécessaire
          ) ??
      const TextStyle();
}


