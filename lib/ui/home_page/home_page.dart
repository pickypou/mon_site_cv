import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final ScrollController scrollController;

  const HomePage({
    super.key,
    required this.scrollController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateScrollOffset);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScrollOffset);
    super.dispose();
  }

  void _updateScrollOffset() {
    setState(() {
      _scrollOffset = widget.scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: [
          // Texte en fond
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: (_scrollOffset < 300) ? 1 - (_scrollOffset / 300) : 0,
              child: Text(
                "Développeur web et web mobile",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.center,
              ),

            ),
          ),

          // Contenu principal
          Padding(
            padding: const EdgeInsets.only(top: 75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Nom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Ludovic SPYSSCHAERT",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 35,),

                SizedBox(height: MediaQuery.of(context).size.height * 0.25),

                // Avatar + logo
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 50,
                    runSpacing: 20,
                    children: [
                      const CircleAvatar(
                        radius: 95,
                        backgroundImage: AssetImage("assets/images/ludo.png"),
                      ),
                      Image.asset(
                        "assets/images/flutter-logo.png",
                        width: isMobile ? 120 : 200,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // Spécialisation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Spécialisé en développement flutter web et mobile",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
