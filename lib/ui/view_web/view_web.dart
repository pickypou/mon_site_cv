import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

class ViewWeb extends StatelessWidget {
  const ViewWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Center(
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("Pourquoi être vu sur le web ?",
                    textAlign: TextAlign.center,
                    style: titleStyleLarge(context)),
              ),
              const SizedBox(height: 50),

              Text(
                "Dans un monde de plus en plus numérique, il est essentiel d'avoir une présence en ligne. "
                "Être visible sur le web permet de se faire connaître, de toucher une audience plus large, "
                "et d'établir une crédibilité auprès de ses clients ou employeurs. Que ce soit pour un projet personnel "
                "ou une entreprise, la visibilité en ligne est un levier incontournable pour le succès.",
                style: textStylePara(context),
              ),
              const SizedBox(height: 20),

              Text(
                "Être visible sur le web permet de se faire connaître auprès d'une audience globale, sans les contraintes géographiques "
                "traditionnelles. Cette portée élargie ouvre des opportunités inédites, que ce soit pour un professionnel en recherche "
                "d'emploi, un freelance proposant ses services, ou une entreprise cherchant à développer sa clientèle.",
                style: textStylePara(context),
              ),
              const SizedBox(height: 20),

              Text(
                "Au-delà de la simple présence, une identité numérique bien construite établit votre crédibilité et votre expertise. "
                "Un site web professionnel, des profils sociaux cohérents et un contenu de qualité renforcent la confiance des visiteurs, "
                "transformant l'intérêt en engagement concret.",
                style: textStylePara(context),
              ),
              const SizedBox(height: 20),

              Text(
                "Pour les entreprises, grandes ou petites, la visibilité en ligne représente un levier stratégique de croissance. "
                "Elle permet d'attirer de nouveaux clients, de fidéliser les existants et de se positionner avantageusement face à la concurrence.",
                style: textStylePara(context),
              ),
              const SizedBox(height: 20),

              Text(
                "En définitive, que vous soyez un particulier avec un projet personnel ou un entrepreneur ambitieux, investir dans votre "
                "présence web est aujourd'hui un passage obligé vers le succès et la reconnaissance dans votre domaine.",
                style: textStylePara(context),
              ),
              const SizedBox(height: 20),

              // Ajout d’un paragraphe sur le SEO
              Text(
                "C’est là qu’intervient le référencement naturel (SEO). En optimisant votre contenu et votre structure web, "
                "vous augmentez vos chances d’apparaître en tête des résultats de recherche, ce qui vous permet d’attirer plus de visiteurs qualifiés.",
                style: textStylePara(context),
              ),
              const SizedBox(height: 20),

              // Ajout d’un paragraphe sur les besoins du client
              Text(
                "Chaque client est unique. C’est pourquoi je m’engage à écouter attentivement vos besoins, à comprendre vos objectifs "
                "et à proposer des solutions adaptées qui vous aideront à atteindre vos ambitions numériques.",
                style: textStylePara(context),
              ),
            ],
          ),
        )));
  }
}
