import 'package:flutter/material.dart';

class RaisonFlutter extends StatelessWidget {

  const RaisonFlutter({
    super.key,

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
                "Pourquoi j’ai choisi Flutter comme spécialisation",textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Quand j’ai commencé à m’intéresser au développement d’applications, j’ai vite réalisé qu’il existait une"
              "multitude d’outils et de frameworks. J’ai testé plusieurs technologies, mais aucune ne m’a autant convaincu que Flutter.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              "Ce qui m’a séduit en premier, c’est la philosophie de développement : écrire une seule fois mon code et le"
              "voir fonctionner sur Android, iOS, le web, et même sur desktop. Pour moi qui aime les choses bien"
              "structurées et efficaces, c’était une évidence. Ça me permet de gagner du temps, mais surtout de garder"
              "une cohérence visuelle et technique sur toutes les plateformes.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              "Flutter m’a aussi plu pour sa souplesse dans le design. J’aime pouvoir donner vie à une interface"
              "exactement comme je l’imagine, sans être bloqué par les limites d’un système natif. Avec Flutter, je peux"
              "créer des animations fluides, des interfaces modernes et des transitions élégantes, sans effort superflu."
              ,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
             "Un autre point fort : la réactivité. Grâce au 'hot reload', je vois directement ce que je code, ce qui rend le"
              "processus beaucoup plus agréable et rapide. C’est motivant, ça booste la créativité, et ça donne envie de toujours aller plus loin."
              ,style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              "Et puis Flutter, ce n’est pas juste un outil : c’est une communauté, une dynamique portée par Google, avec"
              "plein de ressources, de packages, de retours d’expérience. Je ne suis jamais seul quand je développe avec"
              "Flutter, et ça, c’est précieux."
              ,style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
             "En bref, j’ai choisi Flutter parce qu’il allie efficacité, liberté créative et plaisir de coder. Et aujourd’hui, je"
              "suis convaincu que c’est le bon choix pour construire des applications modernes, belles, rapides… et"
              "accessibles à tous."
              ,style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
  }
}
