import 'package:flutter/material.dart';
import '../avis_clients/avis_clients_view.dart';
import '../common/widgets/section_divider.dart';
import '../contact/contact_view.dart';
import '../tarifs_page/tarifs_page.dart';

import '../common/widgets/custom_appbar.dart';
import '../common/widgets/footer.dart';
import '../home_page/home_page.dart';
import '../methode_travail/methode_travail_view.dart';
import '../parcours/parcours_view.dart';
import '../portfolio/portfolio_view.dart';
import '../view_web/view_web.dart';

class ViewAll extends StatelessWidget {
  final GlobalKey accueil = GlobalKey();
  final GlobalKey portfolio = GlobalKey();
  final GlobalKey avis = GlobalKey();
  final GlobalKey methode = GlobalKey();
  final GlobalKey parcours = GlobalKey();
  final GlobalKey viewWeb = GlobalKey();
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
      case 'avis':
        key = avis;
        break;
      case 'methode':
        key = methode;
        break;
      case 'parcours':
        key = parcours;
        break;
      case 'viewWeb':
        key = viewWeb;
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
        duration: const Duration(milliseconds: 700),
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
      drawer: size.width < 1100
          ? CustomDrawer(
              accueil: accueil,
              portfolio: portfolio,
              avis: avis,
              methode: methode,
              parcours: parcours,
              viewWeb: viewWeb,
              tarifs: tarifs,
              contact: contact,
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HomePage(
              key: accueil,
              onContactClick: () => _scrollToSection('contact'),
              onPortfolioClick: () => _scrollToSection('realisation'),
            ),
            const SectionDivider(),
            PortfolioSection(
              key: portfolio,
            ),
            const SectionDivider(),
            AvisClientsView(
              key: avis,
            ),
            const SectionDivider(),
            MethodeTravailView(
              key: methode,
            ),
            const SectionDivider(),
            MonParcoursSection(
              key: parcours,
            ),
            const SectionDivider(),
            ViewWeb(
              key: viewWeb,
            ),
            const SectionDivider(),
            TarifsPage(
              key: tarifs,
              onContactClick: () => _scrollToSection('contact'),
            ),
            const SectionDivider(),
            ContactView(key: contact),
            const SizedBox(height: 35),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
