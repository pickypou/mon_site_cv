import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/home_page/home_page.dart';
import 'package:mon_site_cv/ui/contact/contact_view.dart';
import 'package:mon_site_cv/ui/parcours/parcours_view.dart';
import 'package:mon_site_cv/ui/portfolio/portfolio_view.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Utilisez la couleur de fond désirée
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const HomePage(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const ParcoursView(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const PortfolioView(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child:  ContactView(),
            ),
          ],
        ),
      ),
    );
  }
}
