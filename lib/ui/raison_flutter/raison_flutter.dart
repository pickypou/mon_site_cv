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
                "La puissance de Flutter au service de votre projet",
                textAlign: TextAlign.center,
                style: titleStyleLarge(context),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Pour donner vie à vos idées, j'ai choisi Flutter. Ce framework révolutionnaire créé par Google me permet de construire des applications performantes avec une approche radicalement plus efficace.",
              style: textStylePara(context).copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            _buildFlutterPoint(
              context,
              title: "🚀 Multiplateforme : Un seul code, partout.",
              description: "Économisez du temps et du budget. Votre application fonctionne nativement sur Android, iOS et le Web à partir d'une base de code unique, garantissant une cohérence parfaite.",
            ),
            _buildFlutterPoint(
              context,
              title: "🎨 Design Moderne & Fluide",
              description: "Ne faites aucun compromis sur l'esthétique. Flutter permet de créer des interfaces sur-mesure, élégantes et animées qui captivent vos utilisateurs dès la première seconde.",
            ),
            _buildFlutterPoint(
              context,
              title: "⚡ Développement Ultra-Rapide",
              description: "Grâce au 'Hot Reload', je peux itérer instantanément sur votre projet. Cela signifie des délais de livraison plus courts et une plus grande flexibilité pour vos ajustements.",
            ),
            _buildFlutterPoint(
              context,
              title: "🛡️ Technologie d'Avenir",
              description: "En choisissant Flutter, vous investissez dans une technologie pérenne, maintenue par Google et adoptée par les plus grands noms de la tech mondiale.",
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                "Opter pour Flutter, c'est choisir l'alliance entre performance native et agilité du web.",
                style: titleStyleSmall(context).copyWith(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
    )
        )
      );
  }

  Widget _buildFlutterPoint(BuildContext context,
      {required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: titleStyleSmall(context)
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 8),
          Text(description, style: textStylePara(context)),
        ],
      ),
    );
  }
}
