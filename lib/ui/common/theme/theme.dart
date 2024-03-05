import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    primaryColor: Colors.grey[700], secondaryHeaderColor: Colors.orangeAccent);

TextStyle titleStyle(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titlefont = size.width / 10;
  return Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontSize: titlefont,
        color: theme.secondaryHeaderColor,
        fontFamily: "Lora",
        shadows: [
          const Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Colors.black,
          ),
        ],
      ) ??
      const TextStyle();
}

TextStyle titleStyleMedium(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titlefont = size.width / 18;
  return Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontSize: titlefont,
        color: theme.secondaryHeaderColor,
        fontFamily: "lora",
        shadows: [
          const Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Colors.black,
          ),
        ],
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
