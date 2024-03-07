import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  static const String imagePath = 'assets/images/ludo.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width * 2.1,
      decoration:  const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImageProfile.imagePath), ),
      ),
    );
  }
}
