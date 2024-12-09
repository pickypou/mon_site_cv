import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/theme/theme.dart';
import '../common/widgets/createSlideRoute/create_slide_route.dart';
import '../common/widgets/route_button/route_button.dart';
import '../home_page/home_page.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      color: Theme.of(context).primaryColor,
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Portfolio",
            style: titleStyleMedium(context),
          ),
          const SizedBox(height: 65,),
          Text(
            "Mes réalisations : ",
            style: textStyleText(context),
          ),
          const SizedBox(height: 65,),
          Wrap(
            spacing: 80.0, // espace horizontal entre les images
            runSpacing: 20.0, // espace vertical entre les lignes
            children: [
              // Première image avec lien
              GestureDetector(
                onTap: () async {
                  const url = 'https://photographe-cantin.netlify.app/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  }
                },
                child: Image.asset(
                  'assets/images/charles_cantin.png',
                  width: size.width/5, // ajustez la largeur de l'image
                  height: size.height / 5, // ajustez la hauteur de l'image
                ),
              ),
              // Deuxième image avec lien
              GestureDetector(
                onTap: () async {
                  const url = 'https://judoseclin.fr/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  }
                },
                child: Image.asset(
                  'assets/images/judo_seclin.png',
                  width: size.width/5, // ajustez la largeur de l'image
                  height: size.height / 5, // ajustez la hauteur de l'image
                ),
              ),
              // Troisième image avec lien
              GestureDetector(
                onTap: () async {
                  const url = 'https://les-marcheurs.netlify.app';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  }
                },
                child: Image.asset(
                  'assets/images/les_marcheurs.png',
                  width: size.width/5, // ajustez la largeur de l'image
                  height: size.height / 5, // ajustez la hauteur de l'image
                ),
              ),
              GestureDetector(
                onTap: () async {
                  const url = 'https://lecoconssbe.fr/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  }
                },
                child: Image.asset(
                  'assets/images/le_cocon.png',
                  width: size.width/5, // ajustez la largeur de l'image
                  height: size.height / 5, // ajustez la hauteur de l'image
                ),
              ),
            ],
          ),
          const SizedBox(height: 65,),
          const RouteButton(
            text: "Accueil",
            destinationPage: HomePage(),
            transitionBuilder: slideFromRight,
          ),
        ],
      ),
    );
  }
}
