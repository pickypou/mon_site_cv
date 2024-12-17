import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  primaryColor: Colors.grey[800],
  scaffoldBackgroundColor: Colors.grey[400],
  colorScheme: const ColorScheme(
    brightness: Brightness.light, // Mode clair
    primary: Colors.orange, // Couleur principale
    onPrimary: Color(0xFFFFFFFF), // Couleur du texte sur la couleur primaire
    secondary: Colors.transparent, // Couleur secondaire
    onSecondary: Colors.white, // Texte sur couleur secondaire
    error: Colors.red, // Couleur pour les erreurs
    onError: Colors.white, // Texte sur couleur d'erreur
    surface: Colors.white, // Couleur des surfaces (boutons, cartes, etc.)
    onSurface: Colors.black, // Texte sur les surfaces
  ),
);
MarkdownStyleSheet getMDTheme(BuildContext context, Color transparent) =>
    MarkdownStyleSheet(
      p: textStyleText(
          context), //Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
      h1: titleStyleLarge(
          context), //Theme.of(context).textTheme.headlineLarge?.copyWith(
      // color: fontColor,
      //fontFamily: "Roboto",
      // height: 2,
      //),
      h2: titleStyleSmall(
          context), //Theme.of(context).textTheme.headlineMedium?.copyWith(
      // color: Colors.black,
      // fontFamily: "Roboto",
      // height: 2,
      // ),
      h3: titleStyleSmall(
          context), //Theme.of(context).textTheme.headlineSmall?.copyWith(
      //color: Colors.black,
      // height: 2,
      // ),
      listBullet:
          Theme.of(context).textTheme.bodyLarge?.copyWith(color: transparent),
      listBulletPadding: const EdgeInsets.only(top: 10, left: 20),
    );

TextStyle titleStyle(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double titlefont = size.width / 11;
  return Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: titlefont,
            color: theme.colorScheme.primary,
            fontFamily: "Lora",
            decoration: TextDecoration.none, // Ajoutez cette ligne
          ) ??
      const TextStyle();
}

TextStyle titleStyleLarge(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double titleFontSize = size.width / 15;

  return GoogleFonts.lora().copyWith(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.primary,
    decoration: TextDecoration.none, // Ajoutez cette ligne
  );
}

TextStyle titleStyleMedium(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double titleFontSize = size.width / 25;

  return GoogleFonts.lora().copyWith(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.primary,
    decoration: TextDecoration.none, // Ajoutez cette ligne
  );
}

TextStyle titleStyleSmall(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titleFontSize = size.width / 30;
  return GoogleFonts.lora().copyWith(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.primary,
    decoration: TextDecoration.none, // Ajoutez cette ligne
  );
}

TextStyle textStyleText(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titleFontSize = size.width / 55;
  return GoogleFonts.lato().copyWith(
    fontSize: titleFontSize,
    //fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.primary,
    decoration: TextDecoration.none, // Ajoutez cette ligne
  );
}

TextStyle textStyleTextAccueil(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double? titleFontSize = size.width / 80;
  return GoogleFonts.lato().copyWith(
    fontSize: titleFontSize,
    //fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.primary,
    decoration: TextDecoration.none, // Ajoutez cette ligne
  );
}

TextStyle? textStyleInput(BuildContext context, String inputText) {
  int baseFontSize = 20;
  double textFontSize =
      inputText.length > 20 ? baseFontSize - 1.5 : baseFontSize.toDouble();

  return GoogleFonts.lora().copyWith(
    fontSize: textFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.primary,
    decoration: TextDecoration.none, // Ajoutez cette ligne
  );
}
