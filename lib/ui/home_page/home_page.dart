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
                          child: SizedBox(
                            height: 73,
                            width: MediaQuery.sizeOf(context).width,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      RouteButton(text: 'Mon parcours'),
                                      RouteButton(text: 'Portfolio'),
                                      RouteButton(text: 'Contact'),
                                    ])
                              ],
                            ),
                          ))
                    ]),
              ),
              const ImageProfile(),
            ],
          ),
        ),
      );
    } else if (screenWidth >= 650 && screenWidth < 950) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('SPYSSCHAERT', style: titleStyleMedium(context)),
              Text('Ludovic', style: titleStyleMedium(context)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 15, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Développeur web', style: titleStyleMedium(context)),
                      Text('& web mobile', style: titleStyleMedium(context)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 60),
                          child: SizedBox(
                            height: 100,
                            width: MediaQuery.sizeOf(context).width,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:CrossAxisAlignment.center,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [SizedBox(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          RouteButton(text: 'Mon parcours'),
                                        ],
                                      ),
                                    ),
                                      SizedBox(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            RouteButton(text: 'Portfolio'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            RouteButton(text: 'Portfolio'),
                                          ],
                                        ),
                                      ),



                                      RouteButton(text: 'Contact'),
                                    ])
                              ],
                            ),
                          ))
                    ]),
              ),
              const ImageProfile(),
            ],
          ),
        ),
      );
    } else {
      return const ImageProfile();
    }
  }
}
