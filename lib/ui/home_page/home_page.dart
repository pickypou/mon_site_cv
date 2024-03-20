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
      return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        'SPYSSCHAERT \n Ludovic',
                        style: titleStyleMedium(context),
                      ),
                      Flexible(
                          child: Container(
                        child: const SizedBox(
                          width: double
                              .infinity, // Le SizedBox prend toute la largeur disponible à l'intérieur du Container
                          height: 170,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [RouteButton(text: 'Mon\nparcours')],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [RouteButton(text: 'Portfolio')],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [RouteButton(text: 'Contact')],
                              )
                            ],
                          ),
                        ),
                      )),
                    ]),
                    Flexible(
                      child: Container(
                          child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ImageProfile(),
                              ],
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 200),
                                  child: Text(
                                    'Développeur Web \n & Web Mobile',
                                    style: titleStyleMedium(context),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                      )),
                    ),

                    // rien après
                  ])));
    } else {
      return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Flexible(
              child: Container(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SPYSSCHAERT \n Ludovic', style: titleStyleMedium(context),
                      ),
                    ],
                  ),



                ),
              )

          ),
                    ])
                  ));
    }
  }
}
