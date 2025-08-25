import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/contact/contact_view.dart';
import 'package:mon_site_cv/ui/raison_flutter/raison_flutter.dart';
import 'package:mon_site_cv/ui/tarifs_page/tarifs_page.dart';

import '../common/widgets/custom_appbar.dart';
import '../common/widgets/footer.dart';
import '../home_page/home_page.dart';
import '../parcours/parcours_view.dart';
import '../portfolio/portfolio_view.dart';
import '../view_web/view_web.dart';

class ViewAll extends StatelessWidget {
  final GlobalKey accueil = GlobalKey();
  final GlobalKey portfolio = GlobalKey();
  final GlobalKey parcours = GlobalKey();
  final GlobalKey viewWeb = GlobalKey();
  final GlobalKey flutter = GlobalKey();
  final GlobalKey tarifs = GlobalKey();
  final GlobalKey contact = GlobalKey();

  // Utilisez un seul ScrollController pour la vue principale
  final ScrollController _scrollController = ScrollController();

  ViewAll({super.key});

  void _scrollToSection(String sectionId) {
    GlobalKey? key;
    switch (sectionId) {
      case 'accueil':
        key = accueil;
        break;
      case 'realisation':
        key = portfolio;
        break;
      case 'parcours':
        key = parcours;
        break;
      case 'viewWeb':  // Assurez-vous que cela correspond à ce que vous utilisez dans l'AppBar
        key = viewWeb;
        break;
      case 'flutter':  // Assurez-vous que cela correspond à ce que vous utilisez dans l'AppBar
        key = flutter;
        break;
        case 'tarifs':
          key = tarifs;
          break;

      case 'contact':
        key = contact;
        break;
    }

    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        onNavigate: _scrollToSection,
        actions: const [],
      ),
      drawer: size.width < 749
          ? CustomDrawer(
        accueil: accueil,
        portfolio: portfolio,
        parcours: parcours,
        viewWeb: viewWeb,
        flutter: flutter,
        tarifs: tarifs,
        contact: contact,

     )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,  // Un seul controller ici
        child: Column(
          children: [
            HomePage(
              key: accueil,
              // Ne passez PAS de scrollController ici
            ),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            PortfolioSection(
              key: portfolio,
              // Ne passez PAS de scrollController ici
            ),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            MonParcoursSection(
              key: parcours,
              // Ne passez PAS de scrollController ici
            ),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            ViewWeb(
              key: viewWeb,
              // Ne passez PAS de scrollController ici
            ),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
             RaisonFlutter(key: flutter,),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            TarifsPage(key: tarifs,),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            ContactView(key:contact),
            const SizedBox(height: 35),
            const Footer(),
          ],
        ),
      ),
    );
  }
}