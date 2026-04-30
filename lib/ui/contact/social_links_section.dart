import 'package:flutter/material.dart';
import '../common/widgets/clickable_image.dart';

class SocialLinksSection extends StatelessWidget {
  const SocialLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final iconWidth = isMobile ? 55.0 : 75.0;

    return Wrap(
      spacing: isMobile ? 20 : 35, // Espacement horizontal
      runSpacing: 25, // Espacement vertical entre les lignes
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ClickableImage(
          imagePath: 'assets/images/facebook.webp',
          url: 'https://www.facebook.com/ludowebfreelance/',
          width: iconWidth,
        ),
        ClickableImage(
          imagePath: 'assets/images/whatsapp.png',
          url: 'https://wa.me/33638845768',
          width: iconWidth,
        ),
        ClickableImage(
          imagePath: 'assets/images/malt.png',
          url: 'https://www.malt.fr/profile/ludovicspysschaert?overview',
          width: iconWidth,
        ),
        ClickableImage(
          imagePath: 'assets/images/in.png',
          url: 'https://www.linkedin.com/in/ludovic-spysschaert-6503331b4',
          width: iconWidth,
        ),
        ClickableImage(
          imagePath: 'assets/images/page_jaune.png',
          url: 'https://www.pagesjaunes.fr/pros/63924862',
          width: iconWidth,
        ),
      ],
    );
  }
}
