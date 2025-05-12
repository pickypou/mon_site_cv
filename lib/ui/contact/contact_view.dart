import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/widgets/clickable_image.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSending = false;
  bool _useHttpFallback = false; // Utiliser HTTP comme solution de secours

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) {
      _scrollToTop();
      return;
    }

    setState(() => _isSending = true);

    final data = {
      'name': _nameController.text.trim(),
      'surname': _surnameController.text.trim(),
      'email': _emailController.text.trim(),
      'message': _messageController.text.trim(),
    };

    try {
      // Essayer d'abord avec Firebase Functions
      if (!_useHttpFallback) {
        await _sendWithFirebaseFunctions(data);
      } else {
        // Utiliser HTTP comme solution de secours
        await _sendWithHttp(data);
      }
    } catch (e) {
      debugPrint('Erreur lors de l\'envoi: $e');
      _showSnackBar('Erreur: $e', Colors.red);

      // Si Firebase Functions échoue, essayer avec HTTP
      if (!_useHttpFallback) {
        setState(() => _useHttpFallback = true);
        try {
          debugPrint('Tentative avec HTTP comme solution de secours...');
          await _sendWithHttp(data);
        } catch (httpError) {
          debugPrint('Erreur HTTP: $httpError');
          _showSnackBar('Erreur: $httpError', Colors.red);
        }
      }
    } finally {
      setState(() => _isSending = false);
    }
  }

  Future<void> _sendWithFirebaseFunctions(Map<String, String> data) async {
    debugPrint('Tentative d\'envoi via Firebase Functions...');

    // Spécifier explicitement la région et l'application
    final functions = FirebaseFunctions.instanceFor(
      region: 'us-central1',
      app: Firebase.app(),
    );

    // Ajouter plus de logs
    debugPrint('Données: $data');

    final result = await functions.httpsCallable('sendEmail').call(data);
    debugPrint('Réponse Firebase: ${result.data}');

    final success = result.data is Map && result.data['success'] == true;

    if (success) {
      _showSnackBar('Votre message a été envoyé avec succès!', Colors.green);
      _resetForm();
    } else {
      _showSnackBar('Réponse inattendue: ${result.data}', Colors.orange);
    }
  }

  Future<void> _sendWithHttp(Map<String, String> data) async {
    debugPrint('Tentative d\'envoi via HTTP direct...');

    final url = 'https://us-central1-mon-site-cv-6cdc6.cloudfunctions.net/sendEmailHttp';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    debugPrint('Statut HTTP: ${response.statusCode}');
    debugPrint('Réponse HTTP: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        _showSnackBar('Votre message a été envoyé avec succès!', Colors.green);
        _resetForm();
      } else {
        _showSnackBar('Erreur: ${responseData['message'] ?? "Erreur inconnue"}', Colors.orange);
      }
    } else {
      _showSnackBar('Erreur HTTP: ${response.statusCode}', Colors.red);
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _surnameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  void _showSnackBar(String message, Color background) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: background),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text('Contactez-moi', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 20),

                _buildField(_nameController, 'Nom', size),
                const SizedBox(height: 10),
                _buildField(_surnameController, 'Prénom', size),
                const SizedBox(height: 10),
                _buildField(
                  _emailController,
                  'Email',
                  size,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Veuillez entrer votre email';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Veuillez entrer un email valide';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                _buildField(_messageController, 'Message', size, maxLines: 5),

                const SizedBox(height: 20),
                _buildSendButton(theme),

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

  Widget _buildField(
      TextEditingController controller,
      String label,
      Size size, {
        TextInputType keyboardType = TextInputType.text,
        int maxLines = 1,
        String? Function(String?)? validator,
      }) {
    final theme = Theme.of(context);
    return SizedBox(
      width: size.width * 0.5,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(color: theme.colorScheme.primary),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: theme.colorScheme.primary),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: theme.colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
          ),
          filled: true,
          fillColor: theme.colorScheme.primary.withOpacity(0.05),
        ),
        validator: validator ??
                (value) {
              if (value == null || value.isEmpty) return 'Veuillez entrer votre $label';
              return null;
            },
      ),
    );
  }

  Widget _buildSendButton(ThemeData theme) {
    return ElevatedButton(
      onPressed: _isSending ? null : _sendEmail,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
        backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.pressed)
              ? theme.colorScheme.secondary
              : theme.colorScheme.surface,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
          ),
        ),
      ),
      child: _isSending
          ? const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 10),
          Text('Envoi en cours...'),
        ],
      )
          : const Text('Envoyer'),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}