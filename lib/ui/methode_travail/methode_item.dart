class MethodeItem {
  final String stepNumber;
  final String titre;
  final String description;

  const MethodeItem({
    required this.stepNumber,
    required this.titre,
    required this.description,
  });

  static const List<MethodeItem> data = [
    MethodeItem(
      stepNumber: "1",
      titre: "On échange sur votre activité (30 min)",
      description:
          "On fait le point ensemble par téléphone, autour d'un café ou directement dans vos locaux (je me déplace jusqu'à 70–80 km autour de Seclin). L'objectif : cerner précisément votre activité, vos clients cibles et vos objectifs.",
    ),
    MethodeItem(
      stepNumber: "2",
      titre: "Proposition claire & Devis gratuit",
      description:
          "Vous recevez sous 48h une proposition détaillée avec un prix fixe, transparent et sans mauvaise surprise. Aucun engagement.",
    ),
    MethodeItem(
      stepNumber: "3",
      titre: "Création & validation pas à pas",
      description:
          "Je conçois votre site ou application sur-mesure. Vous suivez l'avancement en toute transparence et vous validez chaque étape avant la mise en ligne.",
    ),
    MethodeItem(
      stepNumber: "4",
      titre: "Mise en ligne & accompagnement",
      description:
          "Votre site est opérationnel, sécurisé et visible sur Google. Je vous montre pas à pas comment l'utiliser et je reste votre interlocuteur disponible pour vous assister.",
    ),
  ];
}
