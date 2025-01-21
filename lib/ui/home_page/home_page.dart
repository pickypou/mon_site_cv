import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/widgets/createSlideRoute/create_slide_route.dart';
import 'package:mon_site_cv/ui/common/widgets/image_profile/image_profile.dart';
import 'package:mon_site_cv/ui/common/widgets/route_button/route_button.dart';
import 'package:mon_site_cv/ui/contact/contact_view.dart';
import 'package:mon_site_cv/ui/parcours/view/parcours_view.dart';
import 'package:mon_site_cv/ui/portfolio/portfolio_view.dart';

import '../../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context);
    final screenHeight = MediaQuery.sizeOf(context);
    final size = MediaQuery.sizeOf(context);

    if (size.width < 750) {
      return Scaffold(
        body: Container(
          width: screenWidth.width,
          height: screenHeight.height,
          color: theme.primaryColor, // Fond d'écran de couleur
          child: Column(
            children: [
              // Partie du texte
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 85, 15, 55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('SPYSSCHAERT', style: titleStyleMedium(context)),
                    Text('Ludovic', style: titleStyleMedium(context)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Développeur web',
                            style: titleStyleMedium(context)),
                        Text('& web mobile', style: titleStyleMedium(context)),
                        const SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
                          child: SizedBox(
                            width: screenWidth.width,
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
                  ],
                ),
              ),
              // Espace flexible qui pousse l'image vers le bas

              const Expanded(
                child: ImageProfile(),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
          width: size.width,
          height: size.height,
          color: theme.primaryColor,
          child: Column(children: [
            // Première partie : Deux colonnes alignées en hauteur
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Colonne gauche
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    width: size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SPYSSCHAERT', style: titleStyleMedium(context)),
                        Text('Ludovic', style: titleStyleMedium(context)),
                      ],
                    ),
                  ),

                  // Colonne droite
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    width: size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Développeur web \n & web mobile',
                          style: titleStyleMedium(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Deuxième partie : Section centrale avec image et boutons
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Image centrale (touche le bas)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.5,
                      child: const ImageProfile(),
                    ),
                  ),

                  // Bouton à gauche (décalé vers la gauche)
                  const Positioned(
                    left: 180, // Décalage supplémentaire
                    child: RouteButton(
                      text: "Portfolio",
                      destinationPage: PortfolioView(),
                      transitionBuilder: slideFromRight,
                    ),
                  ),

                  // Bouton en haut (décalé vers le haut)
                  const Positioned(
                    top: 10, // Décalage supplémentaire vers le haut
                    child: RouteButton(
                      text: "Mon parcours",
                      destinationPage: ParcoursView(),
                      transitionBuilder: slideFromLeft,
                    ),
                  ),

                  // Bouton à droite
                  const Positioned(
                    right: 230,
                    child: RouteButton(
                      text: "Contact",
                      destinationPage: ContactView(),
                      transitionBuilder: slideFromBottom,
                    ),
                  ),
                ],
              ),
            ),
          ]));
    }
  }
}
