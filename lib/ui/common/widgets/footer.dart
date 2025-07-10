import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../theme.dart';

class Footer extends StatelessWidget {
  final double? fontSize;
  const Footer({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Divider(
          color: theme.colorScheme.secondary,
          thickness: 1,
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // ← Ajoutez cette ligne
              children: [
                Flexible( // ← Enveloppez les Text/TextButton dans Flexible
                  child: Text(
                    "© 2025 Ludovic SPYSSCHAERT tous droits réservés",
                    style: textStyleText(context),
                    overflow: TextOverflow.ellipsis, // ← Optionnel pour éviter les débordements
                  ),
                ),
                Flexible(
                  child: Text("75073281000015", style: textStyleText(context),)
                ),
                // ↓ Ajoutez un SizedBox pour l'icône
                SizedBox(
                    width: 40, // ← Largeur garantie
                    child: PopupMenuButton<String>(
                      icon: const Icon(Icons.info_outline, color: Colors.black), // Icône noire visible
                      color: Colors.white, // Fond du menu
                      onSelected: (value) {
                        if (value == 'mentions') {
                          launchUrl(Uri.parse('/mentions-legales.html'));
                        } else if (value == 'confidentialite') {
                          launchUrl(Uri.parse('/confidentialite.html'));
                        } else if (value == 'cookies') {
                          launchUrl(Uri.parse('/cookies.html'));
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem<String>(
                          value: 'mentions',
                          child: Text(
                            'Mentions légales',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'confidentialite',
                          child: Text(
                            'Politique de confidentialité',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'cookies',
                          child: Text(
                            'Politique des cookies',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )


                ),
              ],
            )
        ),
      ],
    );
  }
}