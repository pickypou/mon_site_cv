import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableImage extends StatelessWidget {
  final String imagePath;
  final String? route;
  final String? url;
  final double width;
  final double height;

  const ClickableImage({
    super.key,
    required this.imagePath,
    this.route,
    this.url,
    this.width = 50,
    this.height = 50,
  }) : assert(route != null || url != null,
            'Vous devez fournir soit une route soit une URL.');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (route != null) {
          context.go(route!);
        } else if (url != null) {
          await _launchURL(context, url!);
        }
      },
      child: Tooltip(
        message: route ?? url ?? '',
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Future<void> _launchURL(BuildContext context, String urlString) async {
    final Uri parsedUrl = Uri.parse(urlString);
    if (!await launchUrl(
      parsedUrl,
      mode: LaunchMode.externalApplication,
    )) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Impossible d\'ouvrir l\'URL $urlString')),
      );
    }
  }
}
