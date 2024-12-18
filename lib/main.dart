import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';
import 'package:mon_site_cv/ui/home_page/home_page.dart';

import 'core/di/di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // Utilisez les options générées
  );

  // Configure toutes les dépendances
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ludovic Spysschaert',
      theme: theme,
      home: const HomePage(),
    );
  }
}
