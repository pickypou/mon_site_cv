import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/contact/contact_view.dart';
import 'package:mon_site_cv/ui/parcours/view/parcours_view.dart';
import 'package:mon_site_cv/ui/portfolio/portfolio_view.dart';
import 'package:mon_site_cv/ui/raison_flutter/raison_flutter.dart';
import 'package:mon_site_cv/ui/view_web/view_web.dart';

import '../common/widgets/custom_appbar.dart';
import '../common/widgets/footer.dart';
import '../home_page/home_page.dart';

class ViewAll extends StatelessWidget {
  final GlobalKey accueil = GlobalKey();
  final GlobalKey portfolio = GlobalKey();
  final GlobalKey parcours = GlobalKey();
  final GlobalKey viewWeb = GlobalKey();
  final GlobalKey flutter = GlobalKey();
  final GlobalKey contact = GlobalKey();
  final ScrollController _scrollControllerAccueil = ScrollController();
  final ScrollController _scrollControllerPortfolio = ScrollController();
  final ScrollController _scrollControllerParcours = ScrollController();
  final ScrollController _scrollControllerFlutter = ScrollController();
  final ScrollController _scrollControllerViewWeb = ScrollController();
  final ScrollController _scrollControllerContact = ScrollController();

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
      case 'viewWeb':
        key = viewWeb;
        break;
      case 'flutter':
        key = flutter;
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
        contact: contact,
      )
          : null,
      body: SingleChildScrollView(
        controller: _scrollControllerAccueil,
        child: Column(
          children: [
            HomePage(
              key: accueil,
              scrollController: _scrollControllerAccueil,
            ),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            PortfolioSection(
              key: portfolio,
              scrollController: _scrollControllerPortfolio,
            ),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            MonParcoursSection(
              key: parcours,
              scrollController: _scrollControllerParcours,
            ),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            ViewWeb(key: viewWeb,
                scrollController: _scrollControllerViewWeb
            ),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            RaisonFlutter(key: flutter,
                scrollController: _scrollControllerFlutter),
            const SizedBox(height: 35),
            Image.asset("assets/images/divider.png"),
            const SizedBox(height: 35),
            ContactView(key: contact,
                scrollController: _scrollControllerContact),

            const Footer(),
          ],
        ),
      ),
    );
  }
}

