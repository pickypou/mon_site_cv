import 'package:flutter/material.dart';

import '../common/widgets/clickable_image.dart';
import 'data/portfolio_data.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key, required ScrollController scrollController});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward(); // démarre l’animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedProject(int index, double itemWidth) {
    final project = projects[index];
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(index * 0.1, 1.0, curve: Curves.easeOut),
    );

    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: SizedBox(
          width: itemWidth,
          child: Column(
            children: [
              ClickableImage(
                imagePath: project.imagePath,
                url: project.url,
                width: itemWidth,
                height: itemWidth * 0.6,
              ),
              const SizedBox(height: 8),
              Text(
                project.title,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
          Text(
            "Mes Projets", textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
          ),
      ),
          const SizedBox(height: 25,),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 1000;
              final crossAxisCount = isWide ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
              final itemWidth = (constraints.maxWidth - 24 * (crossAxisCount - 1)) / crossAxisCount;

              return Wrap(
                spacing: 24,
                runSpacing: 32,
                children: List.generate(
                  projects.length,
                      (index) => _buildAnimatedProject(index, itemWidth),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
