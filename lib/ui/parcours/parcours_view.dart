import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

class MonParcoursSection extends StatelessWidget {
  const MonParcoursSection({super.key});

  @override
  Widget build(BuildContext context) {
    const List<_ParcoursItem> parcours = [
      _ParcoursItem(
        icon: Icons.auto_stories,
        titre: "Une passion devenue expertise",
        description:
            "Mon aventure a débuté par une curiosité insatiable pour le code. En autodidacte passionné, j'ai forgé mes bases en HTML, CSS et JavaScript avant de structurer mes connaissances par des certifications reconnues sur Udemy.",
      ),
      _ParcoursItem(
        icon: Icons.school,
        titre: "Formation & Fondations",
        description:
            "Pour professionnaliser ma pratique, j'ai suivi des cursus intensifs en développement web : une certification en développement web (2019) suivie d'une spécialisation Apple Foundation chez Simplon (2020) pour maîtriser l'écosystème Swift.",
      ),
      _ParcoursItem(
        icon: Icons.workspace_premium,
        titre: "Diplôme & Full-Stack",
        description:
            "J'ai consolidé mon expertise chez Studi en obtenant mon diplôme de développeur Full-Stack (Bac +2). Cette étape a marqué mon passage à la maîtrise des architectures complexes Web et Mobile.",
      ),
      _ParcoursItem(
        icon: Icons.star,
        titre: "Spécialisation Flutter",
        description:
            "Aujourd'hui, je dédie mon savoir-faire au framework Flutter. Mon objectif : vous offrir des applications multiplateformes (iOS, Android, Web) d'une fluidité irréprochable avec une maintenance optimisée.",
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Text(
                "Mon Parcours Pro",
                textAlign: TextAlign.center,
                style: titleStyleLarge(context),
              ),
              const SizedBox(height: 50),
              ...parcours.map((item) => _ParcoursCard(item: item)),
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
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
