import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';


class TarifsPage extends StatelessWidget {
  final VoidCallback? onContactClick;

  const TarifsPage({
    super.key,
    this.onContactClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Nos Tarifs",
            style: titleStyleLarge(context)
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(25),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
            child: Text(
              "Transparence totale • Devis gratuit sous 48h",
              style: titleStyleSmall(context).copyWith(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),

          // Tableau principal
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
            headingRowColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimary),
            border: TableBorder.all(color: Theme.of(context).colorScheme.onPrimary),
            columns:  [
              DataColumn(label: Text("Service", style: textStyleText(context))),
              DataColumn(label: Text("Détails", style: textStyleText(context))),
              DataColumn(label: Text("Tarif", style: textStyleText(context))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text("Site vitrine clé en main")),
                DataCell(Text("Création sur-mesure + mobile + mise en ligne sécurisée")),
                DataCell(Text("1 000 €")),
              ]),
              DataRow(cells: [
                DataCell(Text("Maintenance & Sérénité")),
                DataCell(Text("Sauvegardes régulières + mises à jour annuelles + assistance")),
                DataCell(Text("200 € / an")),
              ]),
              DataRow(cells: [
                DataCell(Text("Pack Sérénité")),
                DataCell(Text("Site vitrine complet + 1 an de maintenance offert")),
                DataCell(Text("1 150 €")),
              ]),
              DataRow(cells: [
                DataCell(Text("Fonctionnalités sur-mesure")),
                DataCell(Text("E-commerce, réservations, espace adhérents…")),
                DataCell(Text("Sur devis")),
              ]),
              DataRow(cells: [
                DataCell(Text("Tarif journalier")),
                DataCell(Text("Développement spécifique ou missions d'expertise")),
                DataCell(Text("300 € / jour")),
              ]),
            ],
          ),
        ),

          const SizedBox(height: 25),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "💡 Les garanties incluses dans chaque formule :",
                  style: titleStyleSmall(context).copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("• ⏱️ Livraison rapide : votre site opérationnel en 2 à 3 semaines."),
                const Text("• 🔒 Vous êtes propriétaire à 100% de votre site (nom de domaine et code inclus)."),
                const Text("• 📱 Site 100% réactif et optimisé pour smartphones, tablettes et ordinateurs."),
                const Text("• 🤝 Accompagnement humain et explications claires sans jargon technique."),
                const Text("• 📋 Devis gratuit, transparent et sans engagement sous 48h."),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // CTA direct pour convertir
          ElevatedButton.icon(
            onPressed: onContactClick,
            icon: const Icon(Icons.rocket_launch, size: 20),
            label: const Text(
              "Lancer mon projet • Devis gratuit",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
