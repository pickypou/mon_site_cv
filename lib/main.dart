import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';
import 'package:mon_site_cv/ui/home_page/home_page.dart';

void main() {
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
