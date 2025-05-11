import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/widgets/clickable_image.dart';
import 'package:cloud_functions/cloud_functions.dart';

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

  bool _isSending = false;

  Future<void> _sendEmailViaFirebase() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      try {
        debugPrint('Nom: ${_nameController.text}, Prénom: ${_surnameController.text}, Email: ${_emailController.text}, Message: ${_messageController.text}');
        debugPrint('Tentative d\'appel à la fonction Firebase sendEmail');
        // Appel de la fonction Firebase
        final functions = FirebaseFunctions.instance;
        final result = await functions.httpsCallable('sendEmail').call({
          'name': _nameController.text,
          'surname': _surnameController.text,
          'email': _emailController.text,
          'message': _messageController.text,
        });
        debugPrint('Réponse de la fonction: ${result.data}');

        setState(() {
          _isSending = false;
        });

        if (result.data['success'] == true) {
          // Email envoyé avec succès
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Votre message a été envoyé avec succès!'),
              backgroundColor: Colors.green,
            ),
          );

          // Réinitialiser le formulaire
          _formKey.currentState!.reset();
          _nameController.clear();
          _surnameController.clear();
          _emailController.clear();
          _messageController.clear();
        } else {
          // Erreur lors de l'envoi
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erreur lors de l\'envoi du message.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        setState(() {
          _isSending = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text(
                  "Contactez-moi",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _nameController,
                  label: 'Nom',
                  width: size.width * 0.5,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _surnameController,
                  label: 'Prénom',
                  width: size.width * 0.5,
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
                  width: size.width * 0.5,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _messageController,
                  label: 'Message',
                  maxLines: 5,
                  width: size.width * 0.5,
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
                          return Theme.of(context).colorScheme.secondary;
                        }
                        return Theme.of(context).colorScheme.surface;
                      },
                    ),
                    shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
                          (states) {
                        return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.5,
                          ),
                        );
                      },
                    ),
                  ),
                  onPressed: _isSending ? null : _sendEmailViaFirebase,
                  child: _isSending
                      ? const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('Envoi en cours...'),
                    ],
                  )
                      : const Text('Envoyer'),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClickableImage(
                      imagePath: 'assets/images/facebook.webp',
                      url: 'https://www.facebook.com/ludowebfreelance/',
                    ),
                    SizedBox(width: 35),
                    ClickableImage(
                      imagePath: 'assets/images/whatsapp.png',
                      url: 'https://wa.me/33638845768',
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Le reste de votre code reste inchangé
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
    double? width,
  }) {
    // Votre code existant pour _buildTextField
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        ),
        validator: validator ??
                (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre $label';
              }
              return null;
            },
      ),
    );
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