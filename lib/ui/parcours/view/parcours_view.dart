import 'package:flutter/material.dart';

class MonParcoursSection extends StatelessWidget {
  final ScrollController scrollController;
  const MonParcoursSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final List<_ParcoursItem> parcours = [
      _ParcoursItem(
        titre: "Débuts et Auto-apprentissage",
        description:
        "J'ai commencé ma formation en développement web en regardant des tutoriels sur YouTube. J'ai appris les bases du HTML et du CSS. "
            "Par la suite, j'ai acheté des cours sur Udemy, obtenant plusieurs certificats en HTML. "
            "J'ai ensuite exploré JavaScript et découvert divers frameworks et bibliothèques.",
      ),
      _ParcoursItem(
        titre: "Formation Structurée",
        description:
        "Centre de Formation (2019) : Formation en développement web où j'ai obtenu le certificat Obsquat.\n"
            "Simplon (2020) : Formation \"Apple Fondation\" où j'ai appris les bases de Swift et SwiftUI, avec un certificat à la clé.",
      ),
      _ParcoursItem(
        titre: "Formation Avancée",
        description:
        "Studi (2020) : Formation de développeur full-stack où j'ai obtenu un diplôme de niveau Bac +2 en Développement Web et Mobile.",
      ),
      _ParcoursItem(
        titre: "Compétences Clés",
        description:
        "HTML/CSS : Maîtrise des standards du web.\n"
            "JavaScript : Compétence en frameworks modernes comme ReactJS.\n"
            "PHP Symfony : Expérience avec la programmation côté serveur.\n"
            "Flutter : Développement multi-plateforme avec un seul code.",
      ),
      _ParcoursItem(
        titre: "Spécialisation Actuelle",
        description:
        "Aujourd'hui, je me spécialise en Flutter, un framework qui me permet de développer des applications pour le Web, le mobile, "
            "et des applications de bureau, tout avec un seul code. Flutter est compatible avec divers systèmes d'exploitation, "
            "y compris iOS et Android.",
      ),
    ];

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Mon Parcours",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...parcours.map((item) => _ParcoursCard(item: item)),
            ],
          )

        ),
      ),
    );
  }
}

class _ParcoursItem {
  final String titre;
  final String description;

  _ParcoursItem({required this.titre, required this.description});
}

class _ParcoursCard extends StatelessWidget {
  final _ParcoursItem item;

  const _ParcoursCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.titre,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
