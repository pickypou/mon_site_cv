import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';

import '../common/bouton-route/bouton_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if ( MediaQuery.sizeOf(context).width < 650) {
      return Center(
        child:
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('spysschaert', style: titleStyleMedium(context),
              ),
              Text('Ludovic', style: titleStyleMedium(context),
              ),
              Text('Développeur web', style: titleStyleMedium(context),
              ),
              Text('& web mobile', style: titleStyleMedium(context),
              ),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonRoute(text: 'Parcours',),
                  ButtonRoute(text: 'Portfolio',),
                  ButtonRoute(text: 'Contact',),
                ],
              )
            ],
          ),
        ),
      );
    }else {
      return
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('spysschaert', style: titleStyleMedium(context),
              ),
              Text('Ludovic', style: titleStyleMedium(context),)
            ],
          ),
      );

    }
  }
}
