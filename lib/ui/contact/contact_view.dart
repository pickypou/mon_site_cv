import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/widgets/clickable_image.dart';
import 'package:mon_site_cv/ui/common/widgets/createSlideRoute/create_slide_route.dart';
import 'package:mon_site_cv/ui/common/widgets/route_button/route_button.dart';
import 'package:mon_site_cv/ui/home_page/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme.dart';
import '../parcours/view/parcours_view.dart';
import '../portfolio/portfolio_view.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'spysschaert.ludo@gmail.com',
        query: 'subject=Demande de contact&body=Nom: ${_nameController.text}\n'
            'Prénom: ${_surnameController.text}\n'
            'Email: ${_emailController.text}\n\n'
            'Message: ${_messageController.text}',
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Impossible d\'ouvrir l\'application de messagerie.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Contactez-nous",
                  style: titleStyleMedium(context),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _nameController,
                  label: 'Nom',
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _surnameController,
                  label: 'Prénom',
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _messageController,
                  label: 'Message',
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(WidgetState.pressed)) {
                          return theme.primaryColor; // Fond quand pressé
                        }
                        return theme.primaryColor; // Fond par défaut
                      },
                    ),
                    shape:
                        WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
                      (states) {
                        return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: theme.colorScheme.primary,
                            width: states.contains(WidgetState.pressed)
                                ? 1.5
                                : 1.5, // Bordure dynamique
                          ),
                        );
                      },
                    ),
                  ),
                  onPressed: _sendEmail,
                  child: const Text('Envoyer'),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                   ClickableImage(imagePath: 'assets/images/facebook.webp',
                   url: 'https://www.facebook.com/ludowebfreelance/',
                   )
                  ],

                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RouteButton(
                      text: "Mon parcours",
                      destinationPage: ParcoursView(),
                      transitionBuilder: slideFromRight,
                    ),
                    RouteButton(
                      text: "Accueil",
                      destinationPage: HomePage(),
                      transitionBuilder: slideFromBottom,
                    ),
                    RouteButton(
                      text: "Portfolio",
                      destinationPage: PortfolioView(),
                      transitionBuilder: slideFromLeft,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    Size size = MediaQuery.sizeOf(context);
    return Center(
        child: SizedBox(
            width: size.width *
                0.5, // Largeur personnalisée (ajuste selon tes besoins)
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .primary), // Texte de la couleur primaire
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .primary), // Label de la couleur primaire
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .primary), // Bordure initiale
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .primary), // Bordure activée
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.0), // Bordure quand le champ est focus
                ),
                filled: true,
                fillColor: theme.primaryColor, // Fond du champ
              ),
              validator: validator ??
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre $label';
                    }
                    return null;
                  },
            )));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
