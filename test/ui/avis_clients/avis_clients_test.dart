import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mon_site_cv/ui/avis_clients/avis_clients_view.dart';
import 'package:mon_site_cv/theme.dart';

void main() {
  testWidgets('AvisClientsView renders title, rating and reviews', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: lightTheme,
        home: const Scaffold(
          body: SingleChildScrollView(
            child: AvisClientsView(),
          ),
        ),
      ),
    );

    expect(find.text('Ce que disent mes clients'), findsOneWidget);
    expect(find.textContaining('5.0 / 5'), findsOneWidget);
    expect(find.text('lapetitefeecrochette'), findsOneWidget);
    expect(find.text('Alex'), findsOneWidget);
    expect(find.text('Gérard'), findsOneWidget);
    expect(find.textContaining('Consulter les avis'), findsOneWidget);
  });
}
