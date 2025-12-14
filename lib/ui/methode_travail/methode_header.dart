import 'package:flutter/material.dart';
import 'methode_item.dart';
import 'package:mon_site_cv/theme.dart';

class MethodeHeader extends StatelessWidget {
  final MethodeItem item;

  const MethodeHeader({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              item.stepNumber,
              style: titleStyleSmall(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(item.titre, style: titleStyleSmall(context)),
        ),
      ],
    );
  }
}
