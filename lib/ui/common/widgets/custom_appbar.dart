import 'package:flutter/material.dart';

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
    if (MediaQuery.of(context).size.width > 750) {
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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      leading: _getLeading(context),
      actions: [
        if (MediaQuery.of(context).size.width > 750) // For large screens
          ...[
            _buildNavItem(context, 'Accueil', 'accueil'),
            _buildNavItem(context, 'Mes réalisation', 'realisation'),
            _buildNavItem(context, 'Mon parcours', 'parcours'),
            _buildNavItem(context, 'Etre vu sur le web', 'viewWeb'),
            _buildNavItem(context, 'Ma spécialisation', 'flutter'),
            _buildNavItem(context, 'Contact', 'contact'),
          ],
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
            style: TextStyle(fontSize: 16.0, color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final GlobalKey accueil;
  final GlobalKey portfolio;
  final GlobalKey parcours;
  final GlobalKey viewWeb;
  final GlobalKey flutter;
  final GlobalKey contact;

  const CustomDrawer({
    super.key,
    required this.accueil,
    required this.portfolio,
    required this.parcours,
    required this.viewWeb,
    required this.flutter,
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
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text('Accueil', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            onTap: () {
              _scrollToSection(accueil);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Mes réalisation', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            onTap: () {
              _scrollToSection(portfolio);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Mon parcours', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            onTap: () {
              _scrollToSection(parcours);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Etre vu sur le web', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            onTap: () {
              _scrollToSection(viewWeb);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Ma spécialisation', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            onTap: () {
              _scrollToSection(flutter);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Contact', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
            onTap: () {
              _scrollToSection(contact);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
