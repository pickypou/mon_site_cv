import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  static const String imagePath = 'assets/images/ludo.png';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height, // Prendre toute la hauteur disponible
      child: FittedBox(
        fit: BoxFit.cover, // Ajuste l'image pour couvrir tout l'espace
        child: Image.asset(
          ImageProfile.imagePath,
          width: size.width, // Assure que l'image couvre toute la largeur
          //height: size.height, // Assure que l'image couvre toute la hauteur
        ),
      ),
    );
  }
}
