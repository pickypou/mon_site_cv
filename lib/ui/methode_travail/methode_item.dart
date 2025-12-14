class MethodeItem {
  final String stepNumber;
  final String titre;
  final String description;
  final String? imagePath;

  const MethodeItem({
    required this.stepNumber,
    required this.titre,
    required this.description,
    this.imagePath,
  });

  static const List<MethodeItem> data = [
    MethodeItem(
      stepNumber: "1",
      titre: "Comprendre vos besoins",
      description:
          "Discussion approfondie pour définir objectifs, contraintes et attentes.",
      imagePath: "assets/images/cahier.png",
    ),
    MethodeItem(
      stepNumber: "2",
      titre: "Conception et croquis",
      description:
          "Croquis et schémas pour valider la structure et l’ergonomie.",
      imagePath: "assets/images/croquis.png",
    ),
    MethodeItem(
      stepNumber: "3",
      titre: "Développement Flutter",
      description:
          "Code propre, architecture claire, composants réutilisables.",
      imagePath: "assets/images/code.png",
    ),
    MethodeItem(
      stepNumber: "4",
      titre: "Tests et validation",
      description:
          "Tests unitaires et validation fonctionnelle.",
      imagePath: "assets/images/test.png",
    ),
    MethodeItem(
      stepNumber: "5",
      titre: "Mise en ligne et suivi",
      description:
          "Déploiement, SEO et accompagnement.",
    ),
  ];
}
