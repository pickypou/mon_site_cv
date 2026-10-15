import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme.dart';

class AvisClientsView extends StatelessWidget {
  const AvisClientsView({super.key});

  static const String pagesJaunesUrl = 'https://www.pagesjaunes.fr/pros/63924862';

  Future<void> _openPagesJaunes(BuildContext context) async {
    final uri = Uri.parse(pagesJaunesUrl);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Impossible d\'ouvrir la page des avis')),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Text(
                "Ce que disent mes clients",
                textAlign: TextAlign.center,
                style: titleStyleLarge(context),
              ),
              const SizedBox(height: 12),
              // Badge de note globale
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
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Color(0xFFFFB800), size: 20),
                        Icon(Icons.star, color: Color(0xFFFFB800), size: 20),
                        Icon(Icons.star, color: Color(0xFFFFB800), size: 20),
                        Icon(Icons.star, color: Color(0xFFFFB800), size: 20),
                        Icon(Icons.star, color: Color(0xFFFFB800), size: 20),
                      ],
                    ),
                    Text(
                      "5.0 / 5 • Avis vérifiés Pages Jaunes & Google",
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
              const SizedBox(height: 20),
              Text(
                "Des collaborations humaines basées sur l'écoute, le sur-mesure et la satisfaction complète.",
                textAlign: TextAlign.center,
                style: titleStyleSmall(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 40),

              // Grille responsive des 3 avis clients
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;
                  final cardWidth = isMobile ? constraints.maxWidth : (constraints.maxWidth - 48) / 3;

                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildReviewCard(
                        context: context,
                        width: cardWidth,
                        author: "lapetitefeecrochette",
                        activity: "Féerique & Pétillante (Créations)",
                        source: "Avis vérifié Pages Jaunes",
                        review:
                            "« Merci beaucoup pour la création de notre site Web. Facile d'utilisation et très bien expliqué pour les modifications et ajouts à venir. À l'écoute et patient, Ludo est au top. »",
                      ),
                      _buildReviewCard(
                        context: context,
                        width: cardWidth,
                        author: "Alex",
                        activity: "lespetitescreasdalex (Artisanat)",
                        source: "Avis vérifié Pages Jaunes",
                        review:
                            "« Très professionnel. À l'écoute de mes demandes et soucieux de bien faire selon mes envies. Je suis ravie de mon expérience et je recommande sans hésiter. »",
                      ),
                      _buildReviewCard(
                        context: context,
                        width: cardWidth,
                        author: "Gérard",
                        activity: "Coach Sportif & Judo (gerard.judo.59)",
                        source: "Avis vérifié Pages Jaunes",
                        review:
                            "« Ludovic a été très à l'écoute de mes besoins spécifiques. Il a créé 2 sites internet pour mon centre sportif qui nous aident énormément au quotidien pour la visibilité et la fidélisation de nos adhérents. »",
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 36),

              // Bouton vers Pages Jaunes pour consulter les avis
              OutlinedButton.icon(
                onPressed: () => _openPagesJaunes(context),
                icon: const Icon(Icons.verified, size: 20, color: Color(0xFFFFB800)),
                label: const Text(
                  "Consulter les avis certifiés sur Pages Jaunes ↗",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard({
    required BuildContext context,
    required double width,
    required String author,
    required String activity,
    required String source,
    required String review,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E281F) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withAlpha(25)
              : Colors.black.withAlpha(20),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Étoiles + Source
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.star, color: Color(0xFFFFB800), size: 18),
                  Icon(Icons.star, color: Color(0xFFFFB800), size: 18),
                  Icon(Icons.star, color: Color(0xFFFFB800), size: 18),
                  Icon(Icons.star, color: Color(0xFFFFB800), size: 18),
                  Icon(Icons.star, color: Color(0xFFFFB800), size: 18),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB800).withAlpha(30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  source,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB8860B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Citation du client
          Text(
            review,
            style: textStylePara(context).copyWith(
              fontSize: 14.5,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),

          // Séparateur fin
          Divider(
            color: isDark
                ? Colors.white.withAlpha(20)
                : Colors.black.withAlpha(15),
          ),
          const SizedBox(height: 8),

          // Auteur et activité
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  author.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      author,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      activity,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(160),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
