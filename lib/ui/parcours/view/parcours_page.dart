import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mon_site_cv/domain/entity/parcours.dart';
import 'package:mon_site_cv/ui/home_page/home_page.dart';
import 'package:mon_site_cv/ui/parcours/view/parcours_list_view.dart';

import '../../../theme.dart';
import '../../common/widgets/createSlideRoute/create_slide_route.dart';
import '../../common/widgets/route_button/route_button.dart';
import '../../contact/contact_view.dart';
import '../../portfolio/portfolio_view.dart';

class ParcoursPage extends StatelessWidget {
  const ParcoursPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('parcours')
          .limit(15)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('Aucun texte disponible'));
        }

        // Transformation des données
        List<Parcours> parcours = snapshot.data!.docs
            .map((doc) => Parcours.fromMap(
                  doc.data() as Map<String, dynamic>,
                  doc.id,
                ))
            .toList();

        // Log pour vérifier les données
        debugPrint('Nombre texte : ${parcours.length}');
        for (var parcoursItem in parcours) {
          debugPrint('parcours : ${parcoursItem.text}');
        }

        return Scaffold(
            backgroundColor: theme.primaryColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ParcoursListView(
                  parcours: parcours,
                ),
                const SizedBox(
                  height: 35,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RouteButton(
                      text: "Accueil",
                      destinationPage: HomePage(),
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
              ],
            ));
      },
    );
  }
}
