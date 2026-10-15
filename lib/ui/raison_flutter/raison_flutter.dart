import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

class RaisonFlutter extends StatelessWidget {

  const RaisonFlutter({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Center(
              child:
              Text(
                "La puissance d'une technologie moderne pour votre projet",
                textAlign: TextAlign.center,
                style: titleStyleLarge(context),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Pour donner vie à vos projets, j'utilise Flutter, la technologie développée par Google. Pour vous, cela se traduit par des avantages immédiats en termes de budget, de délais et de confort d'utilisation.",
              style: textStylePara(context).copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            _buildFlutterPoint(
              context,
              title: "🚀 Multiplateforme : Un seul investissement pour être partout",
              description: "Économisez du temps et du budget. Votre projet est disponible à la fois sur iPhone, Android et sur le Web grâce à un développement unique, assurant une parfaite cohérence visuelle.",
            ),
            _buildFlutterPoint(
              context,
              title: "🎨 Design Moderne & Expérience Fluide",
              description: "Ne faites aucun compromis sur l'esthétique. Profitez d'interfaces sur-mesure, élégantes et réactives qui captivent vos clients dès les premières secondes.",
            ),
            _buildFlutterPoint(
              context,
              title: "⚡ Délais Raccourcis & Ajustements en Direct",
              description: "Grâce à des outils modernes d'itération instantanée, nous testons les ajustements en direct. Vous bénéficiez ainsi d'une flexibilité maximale et d'une livraison plus rapide.",
            ),
            _buildFlutterPoint(
              context,
              title: "🛡️ Une Solution Pérenne et Sécurisée",
              description: "Propulsée par Google et utilisée par les plus grandes entreprises mondiales, cette technologie vous garantit un outil robuste, moderne et prêt à évoluer avec votre activité.",
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                "L'assurance d'un outil digital performant, élégant et taillé pour faire grandir votre entreprise.",
                style: titleStyleSmall(context).copyWith(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }

  Widget _buildFlutterPoint(BuildContext context,
      {required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: titleStyleSmall(context)
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 8),
          Text(description, style: textStylePara(context)),
        ],
      ),
    );
  }
}
