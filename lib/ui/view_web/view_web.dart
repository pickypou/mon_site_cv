import 'package:flutter/material.dart';

class ViewWeb extends StatelessWidget {
  final ScrollController scrollController;

  const ViewWeb({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
        child:
          Text(
            "Pourquoi être vu sur le web ?",textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
          const SizedBox(height: 12),
          Text(
            "Dans un monde de plus en plus numérique, il est essentiel d'avoir une présence en ligne. "
                "Être visible sur le web permet de se faire connaître, de toucher une audience plus large, "
                "et d'établir une crédibilité auprès de ses clients ou employeurs. Que ce soit pour un projet personnel "
                "ou une entreprise, la visibilité en ligne est un levier incontournable pour le succès.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Text(
            "Être visible sur le web permet de se faire connaître auprès d'une audience globale, sans les contraintes géographiques . "
                "traditionnelles. Cette portée élargie ouvre des opportunités inédites, que ce soit pour un professionnel en recherche , "
                "d'emploi, un freelance proposant ses services, ou une entreprise cherchant à développer sa clientèle. ",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Text(
            " Au-delà de la simple présence, une identité numérique bien construite établit votre crédibilité et votre expertise. "
                " Un site web professionnel, des profils sociaux cohérents et un contenu de qualité renforcent la confiance des visiteurs,"
                " transformant l'intérêt en engagement concret."
               ,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Text(
            " Pour les entreprises, grandes ou petites, la visibilité en ligne représente un levier stratégique de croissance."
                " Elle permet d'attirer de nouveaux clients, de fidéliser les existants et de se positionner avantageusement face à la concurrence.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Text(
            "En définitive, que vous soyez un particulier avec un projet personnel ou un entrepreneur ambitieux, investir dans votre "
            "présence web est aujourd'hui un passage obligé vers le succès et la reconnaissance dans votre domaine.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
