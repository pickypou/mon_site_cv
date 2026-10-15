import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';


class TarifsPage extends StatelessWidget {
  const TarifsPage({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
            child: Text(
              "Devis gratuit & personnalisé",
              style: titleStyleSmall(context).copyWith(fontSize: 16),
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
              DataColumn(label: Text("Service",style: textStyleText(context)
                ,)),
              DataColumn(label: Text("Détails",style: textStyleText(context)
              )),
              DataColumn(label: Text("Prix",style: textStyleText(context))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text("Site vitrine clé en main")),
                DataCell(Text("Création sur-mesure + mise en ligne sécurisée")),
                DataCell(Text("1000 €")),
              ]),
              DataRow(cells: [
                DataCell(Text("Maintenance & Sérénité")),
                DataCell(Text("Assistance continue + mises à jour annuelles")),
                DataCell(Text("200 € / an")),
              ]),
              DataRow(cells: [
                DataCell(Text("Forfait Sérénité")),
                DataCell(Text("Site vitrine complet + 1 an de maintenance inclus")),
                DataCell(Text("1150 €")),
              ]),
              DataRow(cells: [
                DataCell(Text("Évolutions & Sur-mesure")),
                DataCell(Text("Ajout de fonctionnalités, pages supplémentaires…")),
                DataCell(Text("Sur devis")),
              ]),
              DataRow(cells: [
                DataCell(Text("Tarif journalier")),
                DataCell(Text("Développement spécifique ou missions sur-mesure")),
                DataCell(Text("300 € / jour")),
              ]),
            ],
          ),
        ),

          const SizedBox(height: 20),
          Text(
            "💡 Remarques :",
            style: titleStyleSmall(context)
          ),
          const SizedBox(height: 8),
          const Text("• Les tarifs incluent l'hébergement sécurisé et la mise en ligne."),
          const Text("• Accompagnement humain et explications claires sans jargon technique."),
          const Text("• Devis gratuit, transparent et sans engagement sous 48h."),
        ],
      ),
    );
  }
}
