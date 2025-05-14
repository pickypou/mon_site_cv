import 'package:flutter/material.dart';
import '../common/widgets/clickable_image.dart';

class SocialLinksSection extends StatelessWidget {
  const SocialLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 35, // Gère l'espacement horizontal entre les icônes
      alignment: WrapAlignment.center, // Centre les icônes horizontalement
      children: [
        ClickableImage(
          imagePath: 'assets/images/facebook.webp',
          url: 'https://www.facebook.com/ludowebfreelance/',
          width: 75,
        ),
        ClickableImage(
          imagePath: 'assets/images/whatsapp.png',
          url: 'https://wa.me/33638845768',
          width: 75,
        ),
        ClickableImage(
          imagePath: 'assets/images/malt.png',
          url: 'https://www.malt.fr/profile/ludovicspysschaert?overview',
          width: 75,
        ),
        ClickableImage(
          imagePath: 'assets/images/in.png',
          url: 'https://www.linkedin.com/in/ludovic-spysschaert-6503331b4',
          width: 75,
        ),
        ClickableImage(
          imagePath: 'assets/images/page_jaune.png',
          url: 'https://www.pagesjaunes.fr/pros/63924862',
          width: 75,
        ),
      ],
    );
  }
}
