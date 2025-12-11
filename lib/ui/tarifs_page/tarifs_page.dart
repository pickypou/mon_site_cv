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
          const SizedBox(height: 20),

          // Tableau principal
          DataTable(
            headingRowColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
            border: TableBorder.all(color:theme.colorScheme.onPrimary),
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
                DataCell(Text("Création complète + mise en ligne Firebase")),
                DataCell(Text("900 €")),
              ]),
              DataRow(cells: [
                DataCell(Text("Maintenance annuelle")),
                DataCell(Text("Débogage illimité + 3 mises à jour mineures")),
                DataCell(Text("100 € / an")),
              ]),
              DataRow(cells: [
                DataCell(Text("Forfait complet")),
                DataCell(Text("Site vitrine + maintenance incluse")),
                DataCell(Text("1000 €")),
              ]),
              DataRow(cells: [
                DataCell(Text("Modification hors forfait")),
                DataCell(Text("Ajout / suppression de contenu, nouvelle page…")),
                DataCell(Text("Sur devis ")),
              ]),
              DataRow(cells: [
                DataCell(Text("Tarif journalier")),
                DataCell(Text("Développement spécifique ou missions ponctuelles")),
                DataCell(Text("300 € / jour")),
              ]),
            ],
          ),

          const SizedBox(height: 20),
          Text(
            "💡 Remarques :",
            style: titleStyleSmall(context)
          ),
          const SizedBox(height: 8),
          const Text("• Les tarifs incluent la mise en ligne sur Firebase."),
          const Text("• Les modifications mineures sont incluses dans la maintenance annuelle."),
          const Text("• Toute modification importante ou nouvelle page est facturée hors forfait."),
          const Text("• Le tarif journalier s’applique pour des missions spécifiques ou du développement sur mesure."),
        ],
      ),
    );
  }
}
