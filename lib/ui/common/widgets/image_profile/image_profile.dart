import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  static const String imagePath = 'assets/images/ludo.png';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 650) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 1.8,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                ImageProfile.imagePath,
                fit: BoxFit.fill,
              ),

            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        width: MediaQuery
            .sizeOf(context)
            .width / 2,
        child: Padding(
          padding: EdgeInsets.zero,
          child:
          Image.asset(
            ImageProfile.imagePath,
            fit: BoxFit.cover,
          ),

        ),

      );
    }
  }
}
