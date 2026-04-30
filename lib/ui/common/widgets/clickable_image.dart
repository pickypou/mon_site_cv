import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableImage extends StatefulWidget {
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
  State<ClickableImage> createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          if (widget.route != null) {
            context.go(widget.route!);
          } else if (widget.url != null) {
            await _launchURL(context, widget.url!);
          }
        },
        child: Tooltip(
          message: widget.route ?? widget.url ?? '',
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            transform: () {
              final transformation = Matrix4.identity();
              if (_isHovered) transformation.scaleByDouble(1.05, 1.05, 1.0, 1.0);
              return transformation;
            }(),
            transformAlignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imagePath,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(BuildContext context, String urlString) async {
    final Uri parsedUrl = Uri.parse(urlString);
    try {
      if (!await launchUrl(
        parsedUrl,
        mode: LaunchMode.externalApplication,
      )) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Impossible d\'ouvrir l\'URL $urlString')),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'ouverture : $e')),
      );
    }
  }
}
