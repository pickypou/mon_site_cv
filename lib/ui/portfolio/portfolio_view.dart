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
    final List<Map<String, String>> images = [
      {'path': 'assets/images/judo_seclin.png', 'url': 'https://example1.com'},
      {'path': 'assets/images/charles_cantin.png', 'url': 'https://example2.com'},
      {'path': 'assets/images/les_marcheurs.png', 'url': 'https://example3.com'},
    ];

    return Container(
      color: theme.primaryColor,
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Portfolio",
            style: titleStyleMedium(context),
          ),
          Text(
            "Mes réalisations :",
            style: textStyleText(context),
          ),
          const SizedBox(height: 20),
          // Utilisation de GestureDetector pour ajouter un lien à l'image
          for (var image in images)
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(image['url']!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(image['path']!),
              ),
            ),
          const SizedBox(height: 20),
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
