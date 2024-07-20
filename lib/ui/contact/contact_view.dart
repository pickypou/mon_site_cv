import 'package:flutter/material.dart';

import '../common/theme/theme.dart';
import '../common/widgets/route_button/route_button.dart';
import '../home_page/home_page.dart';
import '../common/widgets/createSlideRoute/create_slide_route.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.primaryColor,
      height: 600,
      child: (
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Contact",
                  style: titleStyleMedium(context),
                ),
               const RouteButton(text: "Accueil", destinationPage: HomePage(), transitionBuilder: slideFromBottom)
              ]
          )
      ),
    );
  }
}
