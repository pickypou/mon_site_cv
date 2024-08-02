import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/widgets/createSlideRoute/create_slide_route.dart';
import 'package:mon_site_cv/ui/common/widgets/image_profile/image_profile.dart';
import 'package:mon_site_cv/ui/common/widgets/route_button/route_button.dart';
import 'package:mon_site_cv/ui/contact/contact_view.dart';
import 'package:mon_site_cv/ui/parcours/parcours_view.dart';
import 'package:mon_site_cv/ui/portfolio/portfolio_view.dart';
import '../common/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        color: theme.primaryColor, // Fond d'écran de couleur
        child: Column(
          children: [
            // Partie du texte
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('SPYSSCHAERT', style: titleStyleMedium(context)),
                  Text('Ludovic', style: titleStyleMedium(context)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Développeur web', style: titleStyleMedium(context)),
                        Text('& web mobile', style: titleStyleMedium(context)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 60),
                          child: SizedBox(
                            height: 73,
                            width: screenWidth,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RouteButton(
                                  text: "Mon parcours",
                                  destinationPage: ParcoursView(),
                                  transitionBuilder: slideFromRight,
                                ),
                                RouteButton(
                                  text: "Portfolio",
                                  destinationPage: PortfolioView(),
                                  transitionBuilder: slideFromLeft,
                                ),
                                RouteButton(
                                  text: "Contact",
                                  destinationPage: ContactView(),
                                  transitionBuilder: slideFromBottom,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Espace flexible qui pousse l'image vers le bas
            //const Spacer(),
            const Expanded(
              child: ImageProfile(),
            ),
          ],
        ),
      ),
    );
  }
}
