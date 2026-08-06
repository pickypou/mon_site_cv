import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

class ViewWeb extends StatelessWidget {
  const ViewWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Text(
                "Pourquoi choisir le digital ?",
                textAlign: TextAlign.center,
                style: titleStyleLarge(context),
              ),
              const SizedBox(height: 16),
              Text(
                "Plus qu'un simple site, je crée votre vitrine 24h/24.",
                textAlign: TextAlign.center,
                style: titleStyleSmall(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;
                  return Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildBenefitCard(
                        context,
                        icon: Icons.public,
                        title: "Visibilité Globale",
                        description: "Dépassez les frontières géographiques. Soyez accessible partout, tout le temps.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                      _buildBenefitCard(
                        context,
                        icon: Icons.verified,
                        title: "Crédibilité & Confiance",
                        description: "Un site pro renforce votre image et rassure vos futurs clients dès le premier clic.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                      _buildBenefitCard(
                        context,
                        icon: Icons.trending_up,
                        title: "Accélérez votre Croissance",
                        description: "Attirez des prospects qualifiés et transformez l'intérêt en engagement concret.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                      _buildBenefitCard(
                        context,
                        icon: Icons.search,
                        title: "Optimisation SEO",
                        description: "Apparaissez là où vos clients vous cherchent : en tête des résultats Google.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                      _buildBenefitCard(
                        context,
                        icon: Icons.psychology,
                        title: "Solution Sur-Mesure",
                        description: "J'écoute vos besoins pour créer l'outil qui correspond précisément à vos ambitions.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required double width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyleMedium(context).copyWith(fontSize: 20),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: textStylePara(context).copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
