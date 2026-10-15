import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';

import '../common/widgets/clickable_image.dart';
import 'data/portfolio_data.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

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
    )..forward();
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
                height: itemWidth * 0.4,
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Center(

            child: Column(
              children: [
                Text(
                  "Mes réalisations",
                  textAlign: TextAlign.center,
                  style: titleStyleLarge(context),
                ),
                const SizedBox(height: 12),
                Text(
                  "Des sites vitrines sur-mesure conçus pour des artisans, indépendants et associations.",
                  textAlign: TextAlign.center,
                  style: titleStyleSmall(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
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
    ),
  ),
);
  }
}
