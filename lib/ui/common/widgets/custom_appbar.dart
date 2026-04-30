import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../../../theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final void Function(String)? onNavigate;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onNavigate,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  Widget? _getLeading(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1100) {
      return null; // No menu button on large screens
    } else {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.onSurface),
      );
    }
  }

  void _scrollToSection(BuildContext context, String sectionId) {
    if (onNavigate != null) {
      onNavigate!(sectionId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      leading: _getLeading(context),
      actions: [
        if (MediaQuery.of(context).size.width > 1100) // For large screens
          ...[
          _buildNavItem(context, 'Accueil', 'accueil'),
          _buildNavItem(context, 'Mes réalisation', 'realisation'),
          _buildNavItem(context, 'Méthode de travail', 'methode'),
          _buildNavItem(context, 'Mon parcours', 'parcours'),
          _buildNavItem(context, 'Etre vu sur le web', 'viewWeb'),
          _buildNavItem(context, 'Ma spécialisation', 'flutter'),
          _buildNavItem(context, 'Tarifs', 'tarifs'),
          _buildNavItem(context, 'Contact', 'contact'),
        ],
        const _ThemeToggleButton(),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String label, String sectionId) {
    return GestureDetector(
      onTap: () => _scrollToSection(context, sectionId),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 16.0, color: Theme.of(context).colorScheme.brightness == Brightness.light 
                    ? Theme.of(context).colorScheme.surface // Beige in light
                    : Theme.of(context).colorScheme.primary), // Light Moss in dark
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final GlobalKey accueil;
  final GlobalKey portfolio;
  final GlobalKey methode;
  final GlobalKey parcours;
  final GlobalKey viewWeb;
  final GlobalKey flutter;
  final GlobalKey tarifs;
  final GlobalKey contact;

  const CustomDrawer({
    super.key,
    required this.accueil,
    required this.portfolio,
    required this.methode,
    required this.parcours,
    required this.viewWeb,
    required this.flutter,
    required this.tarifs,
    required this.contact,
  });

  void _scrollToSection(GlobalKey sectionKey) {
    if (sectionKey.currentContext != null) {
      Scrollable.ensureVisible(
        sectionKey.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).colorScheme.brightness == Brightness.light;
    final textColor = isLight 
        ? Theme.of(context).colorScheme.surface 
        : Theme.of(context).colorScheme.primary;

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Center(child: _ThemeToggleButton()),
          ),
          _buildDrawerItem(context, 'Accueil', accueil, textColor),
          _buildDrawerItem(context, 'Mes réalisations', portfolio, textColor),
          _buildDrawerItem(context, 'Méthode de travail', methode, textColor),
          _buildDrawerItem(context, 'Mon parcours', parcours, textColor),
          _buildDrawerItem(context, 'Être vu sur le web', viewWeb, textColor),
          _buildDrawerItem(context, 'Ma spécialisation', flutter, textColor),
          _buildDrawerItem(context, 'Tarifs', tarifs, textColor),
          _buildDrawerItem(context, 'Contact', contact, textColor),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String label, GlobalKey key, Color textColor) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(color: textColor),
      ),
      onTap: () {
        _scrollToSection(key);
        Navigator.pop(context);
      },
    );
  }
}

class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = getIt<ThemeService>();
    return ListenableBuilder(
      listenable: themeService,
      builder: (context, _) {
        final isDark = themeService.isDarkMode;
        final isLightMode = Theme.of(context).colorScheme.brightness == Brightness.light;
        
        return IconButton(
          onPressed: themeService.toggleTheme,
          icon: Icon(
            isDark ? Icons.light_mode : Icons.dark_mode,
            color: isLightMode 
                ? Theme.of(context).colorScheme.surface 
                : Theme.of(context).colorScheme.primary,
          ),
          tooltip: isDark ? 'Passer au mode clair' : 'Passer au mode sombre',
        );
      },
    );
  }
}
