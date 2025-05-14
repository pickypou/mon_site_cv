import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmailService {
  final BuildContext context;

  EmailService(this.context);

  Future<void> sendEmail({
    required Map<String, String> data,
    required VoidCallback onSuccess,
    required Function(String message, Color color) onError,
    bool useHttpFallback = false,
  }) async {
    try {
      if (!useHttpFallback) {
        await _sendWithFirebaseFunctions(data);
      } else {
        await _sendWithHttp(data);
      }
      onSuccess();
    } catch (e) {
      debugPrint('Erreur Firebase: $e');
      onError('Erreur: $e', Colors.red);
      if (!useHttpFallback) {
        try {
          debugPrint('Tentative HTTP en secours...');
          await _sendWithHttp(data);
          onSuccess();
        } catch (httpError) {
          onError('Erreur HTTP: $httpError', Colors.red);
        }
      }
    }
  }

  Future<void> _sendWithFirebaseFunctions(Map<String, String> data) async {
    debugPrint('Envoi via Firebase Functions...');
    final functions = FirebaseFunctions.instanceFor(
      region: 'us-central1',
      app: Firebase.app(),
    );

    final result = await functions.httpsCallable('sendEmail').call(data);
    debugPrint('Réponse Firebase: ${result.data}');

    if (!(result.data is Map && result.data['success'] == true)) {
      throw Exception('Échec Firebase: ${result.data}');
    }
  }

  Future<void> _sendWithHttp(Map<String, String> data) async {
    debugPrint('Envoi via HTTP direct...');
    const url = 'https://us-central1-mon-site-cv-6cdc6.cloudfunctions.net/sendEmailHttp';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    debugPrint('Statut HTTP: ${response.statusCode}');
    debugPrint('Réponse HTTP: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Erreur HTTP: ${response.statusCode}');
    }

    final responseData = jsonDecode(response.body);
    if (responseData['success'] != true) {
      throw Exception(responseData['message'] ?? 'Erreur inconnue');
    }
  }
}
