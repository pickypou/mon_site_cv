import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

import 'methode_item.dart';
import 'methode_card.dart';

class MethodeTravailView extends StatelessWidget {
  const MethodeTravailView({super.key});

  @override
  Widget build(BuildContext context) {
    final methodes = MethodeItem.data;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Ma Méthode de Travail",
                  style: titleStyleLarge(context),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "De la première rencontre à la mise en ligne, découvrez comment je transforme votre projet en réalité.",
                  style: textStylePara(context),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              ...methodes.map((item) => MethodeCard(item: item)),
            ],
          ),
        ),
      ),
    );
  }
}
