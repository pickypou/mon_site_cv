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
      titre: "Écoute & Analyse de vos besoins",
      description:
          "Échange approfondi pour cerner vos objectifs, vos clients cibles et vos attentes.",
      imagePath: "assets/images/cahier.png",
    ),
    MethodeItem(
      stepNumber: "2",
      titre: "Conception & Ergonomie",
      description:
          "Création de maquettes claires pour valider ensemble la structure et la navigation.",
      imagePath: "assets/images/croquis.png",
    ),
    MethodeItem(
      stepNumber: "3",
      titre: "Développement soigné & moderne",
      description:
          "Conception d'une interface rapide, sécurisée et parfaitement fluide sur tous les écrans.",
      imagePath: "assets/images/code.png",
    ),
    MethodeItem(
      stepNumber: "4",
      titre: "Tests & Contrôle qualité",
      description:
          "Vérifications rigoureuses sur smartphones, tablettes et ordinateurs pour un lancement sans accroc.",
      imagePath: "assets/images/test.png",
    ),
    MethodeItem(
      stepNumber: "5",
      titre: "Mise en ligne & Accompagnement",
      description:
          "Lancement officiel, visibilité sur Google et assistance continue pour une sérénité totale.",
    ),
  ];
}
