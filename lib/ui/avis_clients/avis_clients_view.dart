import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme.dart';

class ClientReview {
  final String author;
  final String activity;
  final String source;
  final String review;
  final int rating;

  const ClientReview({
    required this.author,
    required this.activity,
    required this.source,
    required this.review,
    this.rating = 5,
  });
}

class AvisClientsView extends StatefulWidget {
  final bool fetchFromFirestore;

  const AvisClientsView({
    super.key,
    this.fetchFromFirestore = true,
  });

  static const String pagesJaunesUrl = 'https://www.pagesjaunes.fr/pros/63924862';

  static const List<ClientReview> initialReviews = [
    ClientReview(
      author: "lapetitefeecrochette",
      activity: "Féerique & Pétillante (Créations)",
      source: "Avis vérifié Pages Jaunes",
      review:
          "« Merci beaucoup pour la création de notre site Web. Facile d'utilisation et très bien expliqué pour les modifications et ajouts à venir. À l'écoute et patient, Ludo est au top. »",
      rating: 5,
    ),
    ClientReview(
      author: "Alex",
      activity: "lespetitescreasdalex (Artisanat)",
      source: "Avis vérifié Pages Jaunes",
      review:
          "« Très professionnel. À l'écoute de mes demandes et soucieux de bien faire selon mes envies. Je suis ravie de mon expérience et je recommande sans hésiter. »",
      rating: 5,
    ),
    ClientReview(
      author: "Gérard",
      activity: "Coach Sportif & Judo (gerard.judo.59)",
      source: "Avis vérifié Pages Jaunes",
      review:
          "« Ludovic a été très à l'écoute de mes besoins spécifiques. Il a créé 2 sites internet pour mon centre sportif qui nous aident énormément au quotidien pour la visibilité et la fidélisation de nos adhérents. »",
      rating: 5,
    ),
  ];

  @override
  State<AvisClientsView> createState() => _AvisClientsViewState();
}

class _AvisClientsViewState extends State<AvisClientsView> {
  List<ClientReview> _reviews = AvisClientsView.initialReviews;

  @override
  void initState() {
    super.initState();
    if (widget.fetchFromFirestore) {
      _fetchApprovedReviews();
    }
  }

  Future<void> _fetchApprovedReviews() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('avis_clients')
          .where('isApproved', isEqualTo: true)
          .limit(5)
          .get();

      if (!mounted) return;

      if (snapshot.docs.isNotEmpty) {
        final List<ClientReview> fetched = snapshot.docs.map((doc) {
          final data = doc.data();
          final text = (data['review'] as String? ?? '').trim();
          return ClientReview(
            author: data['author'] as String? ?? 'Client',
            activity: data['activity'] as String? ?? 'Entreprise',
            source: 'Avis vérifié',
            review: text.startsWith('«') ? text : '« $text »',
            rating: (data['rating'] as num?)?.toInt() ?? 5,
          );
        }).toList();

        setState(() {
          _reviews = [...fetched, ...AvisClientsView.initialReviews].take(5).toList();
        });
      }
    } catch (_) {
      // Firebase hors-ligne ou non configuré dans l'environnement courant
    }
  }

  Future<void> _openPagesJaunes(BuildContext context) async {
    final uri = Uri.parse(AvisClientsView.pagesJaunesUrl);
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

  void _showAddReviewDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final authorController = TextEditingController();
    final activityController = TextEditingController();
    final reviewController = TextEditingController();
    int selectedRating = 5;
    bool isSubmitting = false;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: const Row(
                children: [
                  Icon(Icons.rate_review, color: Color(0xFFFFB800)),
                  SizedBox(width: 10),
                  Text("Laisser un avis", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              content: SizedBox(
                width: 450,
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Vous avez collaboré avec moi ? Partagez votre expérience pour aider d'autres indépendants à se lancer !",
                          style: TextStyle(fontSize: 13.5),
                        ),
                        const SizedBox(height: 16),
                        // Note par étoiles
                        Row(
                          children: [
                            const Text("Note : ", style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            ...List.generate(5, (index) {
                              final starValue = index + 1;
                              return IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: Icon(
                                  Icons.star,
                                  color: starValue <= selectedRating
                                      ? const Color(0xFFFFB800)
                                      : Colors.grey.shade400,
                                  size: 26,
                                ),
                                onPressed: () {
                                  setDialogState(() => selectedRating = starValue);
                                },
                              );
                            }),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: authorController,
                          decoration: const InputDecoration(
                            labelText: "Votre Nom / Prénom *",
                            hintText: "Ex : Sophie Martin",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => (value == null || value.trim().isEmpty)
                              ? "Veuillez entrer votre nom"
                              : null,
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: activityController,
                          decoration: const InputDecoration(
                            labelText: "Votre Entreprise / Activité *",
                            hintText: "Ex : Boulangerie du Centre, Coach...",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => (value == null || value.trim().isEmpty)
                              ? "Veuillez préciser votre entreprise"
                              : null,
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: reviewController,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            labelText: "Votre avis *",
                            hintText: "Parlez de la création de votre site, de l'accompagnement, du résultat...",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => (value == null || value.trim().length < 10)
                              ? "Veuillez écrire au moins 10 caractères"
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSubmitting ? null : () => Navigator.pop(dialogContext),
                  child: const Text("Annuler"),
                ),
                ElevatedButton(
                  onPressed: isSubmitting
                      ? null
                      : () async {
                          if (!formKey.currentState!.validate()) return;
                          setDialogState(() => isSubmitting = true);

                          try {
                            await FirebaseFirestore.instance.collection('avis_clients').add({
                              'author': authorController.text.trim(),
                              'activity': activityController.text.trim(),
                              'review': reviewController.text.trim(),
                              'rating': selectedRating,
                              'isApproved': false, // Modération : en attente d'approbation
                              'createdAt': FieldValue.serverTimestamp(),
                            });

                            if (!context.mounted) return;
                            Navigator.pop(dialogContext);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Merci beaucoup pour votre avis ! Il sera publié sur le site après validation.",
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } catch (e) {
                            if (!context.mounted) return;
                            Navigator.pop(dialogContext);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Merci beaucoup pour votre avis ! Il a bien été enregistré.",
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text("Envoyer mon avis"),
                ),
              ],
            );
          },
        );
      },
    );
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

              // Grille responsive des avis clients (max 5)
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;
                  final cardWidth = isMobile ? constraints.maxWidth : (constraints.maxWidth - 48) / 3;

                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: _reviews.map((rev) {
                      return _buildReviewCard(
                        context: context,
                        width: cardWidth,
                        author: rev.author,
                        activity: rev.activity,
                        source: rev.source,
                        review: rev.review,
                        rating: rev.rating,
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: 36),

              // Boutons d'action : Laisser un avis + Consulter Pages Jaunes
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _showAddReviewDialog(context),
                    icon: const Icon(Icons.rate_review_outlined, size: 20),
                    label: const Text(
                      "Laisser un avis client",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
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
    int rating = 5,
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
              Row(
                children: List.generate(
                  rating,
                  (_) => const Icon(Icons.star, color: Color(0xFFFFB800), size: 18),
                ),
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
                  author.isNotEmpty ? author.substring(0, 1).toUpperCase() : 'C',
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
