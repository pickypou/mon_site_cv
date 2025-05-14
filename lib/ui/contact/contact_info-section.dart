import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/widgets/contact_card.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const ContactCard(phone: '33 6 38 84 57 68',
        email: 'spysschaert.ludo@gmail.com',
        address: '13 rue des martyrs 5911 Seclin'
      );
  }
}
