import 'package:flutter/material.dart';

import '../../theme.dart';

class HomePage extends StatefulWidget {
  final ScrollController? scrollController;

  const HomePage({
    super.key,
    this.scrollController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Ludovic SPYSSCHAERT",
                textAlign: TextAlign.center, style: titleStyleLarge(context)),
            const SizedBox(height: 40),
            Text("Développeur web et web mobile",
                textAlign: TextAlign.center, style: titleStyleLarge(context)),
            const SizedBox(height: 50),
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 50,
              runSpacing: 20,
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage("assets/images/ludo.png"),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              "Spécialisé en développement flutter web et mobile",
              textAlign: TextAlign.center,
              style: titleStyleMedium(context),
            ),
          ],
        ),
      ),
    );
  }
}
