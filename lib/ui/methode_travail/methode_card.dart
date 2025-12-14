import 'package:flutter/material.dart';
import 'methode_item.dart';
import 'methode_header.dart';
import 'responsive_image.dart';
import 'package:mon_site_cv/theme.dart';

class MethodeCard extends StatelessWidget {
  final MethodeItem item;

  const MethodeCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MethodeHeader(item: item),
          const SizedBox(height: 16),
          Text(item.description, style: textStylePara(context)),
          if (item.imagePath != null) ...[
            const SizedBox(height: 20),
            ResponsiveImage(imagePath: item.imagePath!),
          ],
        ],
      ),
    );
  }
}
