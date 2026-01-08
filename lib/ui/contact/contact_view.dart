import 'package:flutter/material.dart';
import 'package:mon_site_cv/theme.dart';
import 'package:mon_site_cv/ui/contact/social_links_section.dart';

import 'contact_form.dart';
import 'contact_info_section.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth >= 800;

        const infoSection = Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContactInfoSection(),
            SizedBox(height: 20),
            SocialLinksSection(),
          ],
        );

        const formSection = FormContact();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ✅ Le titre de la page
                  Text('Contactez-moi',
                      textAlign: TextAlign.center,
                      style: titleStyleLarge(context)),

                  const SizedBox(height: 32),

                  // ✅ Grille responsive
                  isWide
                      ? const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: infoSection),
                            SizedBox(width: 40),
                            Expanded(child: formSection),
                          ],
                        )
                      : const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            formSection,
                            SizedBox(height: 40),
                            infoSection,
                          ],
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
