import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  static const String imagePath = 'assets/images/ludo.png';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Flex(
        direction: size.width > size.height ? Axis.horizontal : Axis.vertical,
    mainAxisAlignment: size.width > size.height
      ? MainAxisAlignment.start
    :MainAxisAlignment.end,
    children: [
      Flexible(
          flex: 1,
          child: Image.asset(
            ImageProfile.imagePath,
            fit: BoxFit.cover,
          ))
    ],
    );

  }
}
