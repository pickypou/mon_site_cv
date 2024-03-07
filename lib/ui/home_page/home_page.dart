import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';
import 'package:mon_site_cv/ui/common/widgets/image_profile/image_profile.dart';

import '../common/widgets/route_button/route_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 650) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('spysschaert', style: titleStyleMedium(context)),
              Text('Ludovic', style: titleStyleMedium(context)),
              Text('Développeur web', style: titleStyleMedium(context)),
              Text('& web mobile', style: titleStyleMedium(context)),
              const SizedBox(height: 60),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RouteButton(text: 'Parcours'),
                  RouteButton(text: 'portfolio'),
                  RouteButton(text: 'Contact'),
                ],
              ),
              Stack(
                children: [
                  ImageProfile(),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('spysschaert', style: titleStyleMedium(context)),
            Text('Ludovic', style: titleStyleMedium(context)),
            Text('Développeur web', style: titleStyleMedium(context)),
            Text('& web mobile', style: titleStyleMedium(context)),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RouteButton(text: 'Parcours'),
                RouteButton(text: 'portfolio'),
                RouteButton(text: 'Contact'),
              ],
            ),
          ],
        ),
      );
    }
  }
}
