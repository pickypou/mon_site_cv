import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/widgets/image_profile/image_profile.dart';
import 'package:mon_site_cv/ui/common/widgets/route_button/route_button.dart';

import '../common/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

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
              Text('SPYSSCHAERT', style: titleStyleMedium(context)),
              Text('Ludovic', style: titleStyleMedium(context)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Développeur web', style: titleStyleMedium(context)),
                      Text('& web mobile', style: titleStyleMedium(context)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 60),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    RouteButton(
                                      text: 'Parcours',
                                    ),
                                    RouteButton(text: 'Portfolio'),
                                    RouteButton(text: 'Contact')
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9
                                  ,
                                  child: const ImageProfile(),
                                ),
                              ]))
                    ]),
              )
            ],
          ),
        ),
      );
    } else if (screenWidth >= 650 && screenWidth < 950) {
      return const ImageProfile();
    } else {
      return const ImageProfile();
    }
  }
}
