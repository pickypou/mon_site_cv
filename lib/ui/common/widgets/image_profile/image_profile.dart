import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  static const String imagePath = 'assets/images/ludo.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height /2,
      width: MediaQuery.sizeOf(context).width ,
         child:
      Image.asset(
        ImageProfile.imagePath,
        fit: BoxFit.fill,
      ),

    );
  }
}
