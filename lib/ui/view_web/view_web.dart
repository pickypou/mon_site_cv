import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

class ViewWeb extends StatelessWidget {
  const ViewWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        title: "Visibilité 24h/24",
                        description: "Dépassez les horaires d'ouverture. Soyez accessible et trouvable facilement, tout le temps.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                      _buildBenefitCard(
                        context,
                        icon: Icons.verified,
                        title: "Crédibilité & Confiance",
                        description: "Une présence soignée renforce votre professionnalisme et rassure vos prospects dès le premier clic.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                      _buildBenefitCard(
                        context,
                        icon: Icons.trending_up,
                        title: "Développez votre Clientèle",
                        description: "Attirez de nouvelles demandes de devis et facilitez la prise de contact pour vos clients.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                      _buildBenefitCard(
                        context,
                        icon: Icons.search,
                        title: "Visibilité Google (SEO)",
                        description: "Apparaissez là où vos clients vous cherchent : parmi les premiers résultats sur votre secteur.",
                        width: isMobile ? constraints.maxWidth : 300,
                      ),
                      _buildBenefitCard(
                        context,
                        icon: Icons.handshake,
                        title: "Accompagnement de Proximité",
                        description: "Un interlocuteur unique à votre écoute à Seclin pour un projet sans intermédiaire ni prise de tête.",
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
