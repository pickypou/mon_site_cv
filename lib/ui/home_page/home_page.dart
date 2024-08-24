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
                    const SizedBox(
                      height: 45,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Développeur web',
                            style: titleStyleMedium(context)),
                        Text('& web mobile', style: titleStyleMedium(context)),
                        const SizedBox(
                          height: 45,
                        ),
                        Text(
                          '''J'ai débuté en autodidacte, en apprenant les bases du développement web avec HTML et CSS à travers des tutoriels YouTube,
     puis j'ai approfondi mes connaissances avec des cours sur Udemy, en me spécialisant progressivement dans
     JavaScript et des frameworks comme jQuery et ReactJS.
     Mon apprentissage s'est ensuite structuré avec des formations certifiantes :
     un certificat Obsquat en développement web en 2019 et une formation "Apple Fondation" chez Simplon
     où j'ai découvert Swift et SwiftUI. En 2020, j'ai obtenu un diplôme de développeur full-stack de
     niveau Bac +2 avec Studi.
     Aujourd'hui, je me concentre sur Flutter, un framework multi-plateforme me permettant de créer des
     applications web, mobiles et desktop avec un seul code, compatible avec iOS et Android.''',
                          style: textStyleText(context),
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
      return Scaffold(
        body: Container(
          color: theme.primaryColor, // Applique la couleur de fond ici
          child: Row(
            children: [
              // Colonne gauche : Boutons et image
              Expanded(
                flex: 1, // Proportion de la colonne gauche
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Conteneur pour les boutons de navigation
                    const Padding(
                      padding: EdgeInsets.fromLTRB(35, 35, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RouteButton(
                            text: "Mon parcours",
                            destinationPage: ParcoursView(),
                            transitionBuilder: slideFromRight,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(200, 45, 0, 0),
                            child: RouteButton(
                              text: "Portfolio",
                              destinationPage: PortfolioView(),
                              transitionBuilder: slideFromLeft,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(325, 45, 0, 0),
                            child: RouteButton(
                              text: "Contact",
                              destinationPage: ContactView(),
                              transitionBuilder: slideFromBottom,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child:
                            const ImageProfile(), // Assurez-vous que ce widget est correctement configuré
                      ),
                    ),
                  ],
                ),
              ),
              // Colonne droite : Texte
              Expanded(
                flex: 2, // Proportion de la colonne droite
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SPYSSCHAERT', style: titleStyleMedium(context)),
                      Text('Ludovic', style: titleStyleMedium(context)),
                      const SizedBox(height: 25),
                      Text(
                        'Développeur web \n & web mobile',
                        style: titleStyleMedium(context),
                      ),
                      const SizedBox(height: 25,),
                      Text(
                        '''J'ai débuté en autodidacte, en apprenant les bases du développement web avec HTML et CSS à travers des tutoriels YouTube,
     puis j'ai approfondi mes connaissances avec des cours sur Udemy, en me spécialisant progressivement dans
     JavaScript et des frameworks comme jQuery et ReactJS.
     Mon apprentissage s'est ensuite structuré avec des formations certifiantes :
     un certificat Obsquat en développement web en 2019 et une formation "Apple Fondation" chez Simplon
     où j'ai découvert Swift et SwiftUI. En 2020, j'ai obtenu un diplôme de développeur full-stack de
     niveau Bac +2 avec Studi.
     Aujourd'hui, je me concentre sur Flutter, un framework multi-plateforme me permettant de créer des
     applications web, mobiles et desktop avec un seul code, compatible avec iOS et Android.''',
                        style: textStyleTextAccueil(context),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
