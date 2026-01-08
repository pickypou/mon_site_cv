import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mon_site_cv/ui/contact/contact_form.dart';
import 'package:mon_site_cv/theme.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      theme: theme,
      home: const Scaffold(
        body: FormContact(),
      ),
    );
  }

  group('FormContact Widget Tests', () {
    testWidgets('renders all text fields and submit button',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Nom'), findsOneWidget);
      expect(find.text('Prénom'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Message'), findsOneWidget);
      expect(find.text('Envoyer'), findsOneWidget);
    });

    testWidgets('shows validation errors when fields are empty',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(createWidgetUnderTest());

      // Tap the submit button without entering text
      expect(find.text('Nom'), findsOneWidget);
      expect(find.text('Envoyer'), findsOneWidget);

      await tester.tap(find.text('Envoyer'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Veuillez entrer votre Nom', skipOffstage: false),
          findsOneWidget);
      expect(find.text('Veuillez entrer votre Prénom', skipOffstage: false),
          findsOneWidget);
      expect(find.text('Veuillez entrer votre email', skipOffstage: false),
          findsOneWidget);
    });

    testWidgets('shows validation error for invalid email',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Enter invalid email
      await tester.enterText(find.byType(TextFormField).at(2), 'invalid-email');
      await tester.tap(find.text('Envoyer'));
      await tester.pump();

      expect(find.text('Veuillez entrer un email valide'), findsOneWidget);
    });

    testWidgets('does not show validation errors when fields are valid',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Enter valid data
      await tester.enterText(find.byType(TextFormField).at(0), 'Doe'); // Nom
      await tester.enterText(
          find.byType(TextFormField).at(1), 'John'); // Prénom
      await tester.enterText(
          find.byType(TextFormField).at(2), 'john.doe@example.com'); // Email
      await tester.enterText(
          find.byType(TextFormField).at(3), 'Hello World'); // Message

      // Tap submit
      await tester.tap(find.text('Envoyer'));
      await tester.pump();

      // Verify no validation errors are present
      expect(find.text('Veuillez entrer votre Nom'), findsNothing);
      expect(find.text('Veuillez entrer votre Prénom'), findsNothing);
      expect(find.text('Veuillez entrer un email valide'), findsNothing);
    });
  });
}
