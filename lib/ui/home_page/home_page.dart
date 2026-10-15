import 'package:flutter/material.dart';

import '../../theme.dart';

class HomePage extends StatefulWidget {
  final ScrollController? scrollController;
  final VoidCallback? onContactClick;
  final VoidCallback? onPortfolioClick;

  const HomePage({
    super.key,
    this.scrollController,
    this.onContactClick,
    this.onPortfolioClick,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 950),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Badge de réassurance / avis
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2C3E2D) : const Color(0xFFE8EFE9),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.5,
                  ),
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFB800), size: 18),
                    Text(
                      "5.0 / 5 sur Google & Pages Jaunes • 100% de clients satisfaits",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Titre principal orienté bénéfice client
              Text(
                "Donnez à votre activité\nle site web qu'elle mérite",
                textAlign: TextAlign.center,
                style: titleStyleLarge(context).copyWith(
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),

              // Sous-titre rassurant et clair
              Text(
                "Création de sites web modernes, rapides et clés en main pour artisans, commerçants & indépendants.",
                textAlign: TextAlign.center,
                style: titleStyleMedium(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 35),

              // Photo de Ludovic avec contour soigné
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withAlpha(50),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/ludo.webp"),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                "Ludovic SPYSSCHAERT • Développeur Web & Mobile",
                textAlign: TextAlign.center,
                style: titleStyleSmall(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                "Un accompagnement humain de A à Z : je m'occupe de la technique, du design et de la mise en ligne pour que vous puissiez vous concentrer sur vos clients.",
                textAlign: TextAlign.center,
                style: textStylePara(context).copyWith(fontSize: 16),
              ),
              const SizedBox(height: 28),

              // Puces d'avantages concrets
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 10,
                children: [
                  _buildFeatureBadge(context, Icons.timer_outlined, "Prêt en 2 à 3 semaines"),
                  _buildFeatureBadge(context, Icons.person_outline, "Interlocuteur unique"),
                  _buildFeatureBadge(context, Icons.lock_outline, "100% propriétaire sans abonnement caché"),
                ],
              ),
              const SizedBox(height: 40),

              // Double CTA (Call To Action)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 16,
                children: [
                  ElevatedButton.icon(
                    onPressed: widget.onContactClick,
                    icon: const Icon(Icons.send_rounded, size: 20),
                    label: const Text(
                      "Demander mon devis gratuit",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: widget.onPortfolioClick,
                    icon: const Icon(Icons.remove_red_eye_outlined, size: 20),
                    label: const Text(
                      "Voir mes réalisations",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (widget.scrollController != null) {
      return SingleChildScrollView(
        controller: widget.scrollController,
        child: content,
      );
    }
    return content;
  }

  Widget _buildFeatureBadge(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
