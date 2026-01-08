import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme.dart';

class MapPreviewWidget extends StatelessWidget {
  const MapPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        const String googleMapsUrl =
            'https://www.google.com/maps?q=50.55156106331736,3.0242009236072227';

        if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
          await launchUrl(Uri.parse(googleMapsUrl),
              mode: LaunchMode.externalApplication);
        } else {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Impossible d’ouvrir Google Maps')),
          );
        }
      },
      icon: const Icon(Icons.map),
      label: Text(
        'Pour me localiser voir sur la carte',
        style: textStyleText(context),
      ),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          backgroundColor: theme.colorScheme.primary,
          side: BorderSide(
            color: theme.colorScheme.secondary,
            width: 1,
          )),
    );
  }
}
