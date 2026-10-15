import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

class MonParcoursSection extends StatelessWidget {
  const MonParcoursSection({super.key});

  @override
  Widget build(BuildContext context) {
    const List<_ParcoursItem> piliers = [
      _ParcoursItem(
        icon: Icons.person_pin_outlined,
        titre: "Un interlocuteur unique et local",
        description:
            "Pas d'intermédiaire, pas de standard impersonnel. Vous échangez directement avec moi, de la première discussion jusqu'au suivi de votre site.",
      ),
      _ParcoursItem(
        icon: Icons.lightbulb_outline,
        titre: "Pragmatisme & écoute",
        description:
            "Je privilégie les solutions utiles et rentables pour votre activité, sans vous vendre des options inutiles ou trop compliquées.",
      ),
      _ParcoursItem(
        icon: Icons.flash_on_outlined,
        titre: "Réactivité & proximité",
        description:
            "Basé à Seclin, je suis disponible rapidement si vous avez une question, une mise à jour ou un besoin d'ajustement.",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Text(
                "Pourquoi travailler avec moi ?",
                textAlign: TextAlign.center,
                style: titleStyleLarge(context),
              ),
              const SizedBox(height: 18),
              Text(
                "Installé à Seclin, je mets mon exigence technique et mon sens de l'écoute au service des indépendants et entreprises de la région. Mon objectif : concevoir des outils web et mobiles fiables, esthétiques et faciles à vivre au quotidien pour vous faire gagner du temps et des clients.",
                textAlign: TextAlign.center,
                style: textStylePara(context).copyWith(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 50),
              ...piliers.map((item) => _ParcoursCard(item: item)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ParcoursItem {
  final IconData icon;
  final String titre;
  final String description;

  const _ParcoursItem({
    required this.icon,
    required this.titre,
    required this.description,
  });
}

class _ParcoursCard extends StatelessWidget {
  final _ParcoursItem item;

  const _ParcoursCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.titre,
                      style: titleStyleMedium(context).copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.description,
                      style: textStylePara(context),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
