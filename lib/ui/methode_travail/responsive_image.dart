import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final String imagePath;

  const ResponsiveImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Largeur max contrôlée
    final double maxWidth = screenWidth < 600
        ? screenWidth // mobile
        : 600;        // desktop/tablette

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 48),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
