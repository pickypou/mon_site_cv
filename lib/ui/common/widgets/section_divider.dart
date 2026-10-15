import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        Image.asset("assets/images/divider.webp"),
        const SizedBox(height: 35),
      ],
    );
  }
}
