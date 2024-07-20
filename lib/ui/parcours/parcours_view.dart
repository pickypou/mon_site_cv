import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';
import 'package:mon_site_cv/ui/common/widgets/createSlideRoute/create_slide_route.dart';
import 'package:mon_site_cv/ui/common/widgets/route_button/route_button.dart';
import 'package:mon_site_cv/ui/home_page/home_page.dart';
import '../common/widgets/info-profil/info_profil.dart';

class ParcoursView extends StatelessWidget {
  const ParcoursView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.primaryColor, // Changez cette couleur selon vos besoins
      child: SizedBox(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mon parcours",
                  style: titleStyleMedium(context),
                ),
                const Padding(
                  padding: EdgeInsets.all(60),
                  child: Center(
                    child: InfoProfil(docUrl: 'assets/markdown/mon-parcours.md'),
                  ),
                ),
                const RouteButton(text: "Accueil", destinationPage: HomePage(), transitionBuilder: slideFromLeft)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
