import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../contact/map_preview_widget.dart';

class ContactCard extends StatelessWidget {
  final double? fontSize;
  final String phone;
  final String email;
  final String address;

  const ContactCard({
    super.key,
    required this.phone,
    required this.email,
    required this.address,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Détermine une largeur max raisonnable selon la taille de l'écran
    final double maxCardWidth = screenWidth > 800
        ? 400
        : screenWidth > 600
        ? 350
        : double.infinity; // Prend toute la largeur sur petit écran

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxCardWidth,
        ),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                _buildContactRow(context, Icons.phone, phone),
                const SizedBox(height: 8),
                _buildContactRow(context, Icons.email, email),
                const SizedBox(height: 8),
                _buildContactRow(context, Icons.location_on, address),
                const SizedBox(height: 8),
                const MapPreviewWidget(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactRow(BuildContext context, IconData icon, String text) {

    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
        const SizedBox(width: 8),
        if (icon == Icons.email)
          GestureDetector(
            onTap: () => _launchMail(text),
            child: Text(
              text,
              style:textStyleText(context)
                  ),
            )

        else
          Text(
            text,
            style: textStyleText(context)
          ),
      ],
    );
  }



  Future<void> _launchMail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Impossible d\'ouvrir le client de messagerie pour $email';
    }
  }
}
