import 'package:flutter/material.dart';
import 'methode_item.dart';
import 'methode_header.dart';
import 'package:mon_site_cv/theme.dart';

class MethodeCard extends StatelessWidget {
  final MethodeItem item;

  const MethodeCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E281F) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white.withAlpha(20) : Colors.black.withAlpha(15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MethodeHeader(item: item),
          const SizedBox(height: 12),
          Text(
            item.description,
            style: textStylePara(context).copyWith(fontSize: 15, height: 1.5),
          ),
        ],
      ),
    );
  }
}
