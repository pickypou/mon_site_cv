import 'package:flutter/material.dart';
import '../../../core/service/email_service.dart';

class FormButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const FormButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.surnameController,
    required this.emailController,
    required this.messageController,
  });

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  bool _isSending = false;

  Future<void> _sendEmail() async {
    if (!widget.formKey.currentState!.validate()) return;

    setState(() => _isSending = true);

    final data = {
      'name': widget.nameController.text,
      'surname': widget.surnameController.text,
      'email': widget.emailController.text,
      'message': widget.messageController.text,
    };

    final emailService = EmailService(context);

    await emailService.sendEmail(
      data: data,
      onSuccess: () {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email envoyé avec succès.'), backgroundColor: Colors.green),
        );
        widget.formKey.currentState!.reset();
      },
      onError: (message, color) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: color),
        );
      },
    );

    setState(() => _isSending = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
          SizedBox(width: 10),
          Text('Envoi en cours...'),
        ],
      )
          : const Text('Envoyer'),
    );
  }
}
