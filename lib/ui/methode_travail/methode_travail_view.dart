import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

import 'methode_item.dart';
import 'methode_card.dart';

class MethodeTravailView extends StatelessWidget {
  const MethodeTravailView({super.key});

  @override
  Widget build(BuildContext context) {
    const methodes = MethodeItem.data;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Comment nous travaillons ensemble",
                  style: titleStyleLarge(context),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  "4 étapes simples, claires et sans jargon pour concrétiser votre projet en toute sérénité.",
                  style: textStylePara(context).copyWith(fontSize: 18),
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
