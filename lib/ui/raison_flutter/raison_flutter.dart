import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

class RaisonFlutter extends StatelessWidget {

  const RaisonFlutter({
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
              child:
              Text(
                "Pourquoi j’ai choisi Flutter ",textAlign: TextAlign.center,
                style: titleStyleLarge(context)
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Quand j’ai commencé à m’intéresser au développement d’applications, j’ai vite réalisé qu’il existait une "
              "multitude d’outils et de frameworks. J’ai testé plusieurs technologies, mais aucune ne m’a autant convaincu que Flutter.",
              style: textStylePara(context)
            ),
            const SizedBox(height: 20),
            Text(
              "Ce qui m’a séduit en premier, c’est la philosophie de développement : écrire une seule fois mon code et le "
              "voir fonctionner sur Android, iOS, le web, et même sur desktop. Pour moi qui aime les choses bien "
              "structurées et efficaces, c’était une évidence. Ça me permet de gagner du temps, mais surtout de garder "
              "une cohérence visuelle et technique sur toutes les plateformes.",
              style: textStylePara(context)
            ),
            const SizedBox(height: 20),
            Text(
              "Flutter m’a aussi plu pour sa souplesse dans le design. J’aime pouvoir donner vie à une interface "
              "exactement comme je l’imagine, sans être bloqué par les limites d’un système natif. Avec Flutter, je peux "
              "créer des animations fluides, des interfaces modernes et des transitions élégantes, sans effort superflu. "
              ,
              style: textStylePara(context)
            ),
            const SizedBox(height: 20),
            Text(
             "Un autre point fort : la réactivité. Grâce au 'hot reload', je vois directement ce que je code, ce qui rend le "
              "processus beaucoup plus agréable et rapide. C’est motivant, ça booste la créativité, et ça donne envie de toujours aller plus loin. "
              ,style: textStylePara(context)
            ),
            const SizedBox(height: 20),
            Text(
              "Et puis Flutter, ce n’est pas juste un outil : c’est une communauté, une dynamique portée par Google, avec "
              "plein de ressources, de packages, de retours d’expérience. Je ne suis jamais seul quand je développe avec "
              "Flutter, et ça, c’est précieux."
              ,style: textStylePara(context)
            ),
            const SizedBox(height: 20),
            Text(
             "En bref, j’ai choisi Flutter parce qu’il allie efficacité, liberté créative et plaisir de coder. Et aujourd’hui, je "
              "suis convaincu que c’est le bon choix pour construire des applications modernes, belles, rapides… et "
              "accessibles à tous."
              ,style: textStylePara(context)
            ),
          ],
        ),
    )
        )
      );
  }
}
