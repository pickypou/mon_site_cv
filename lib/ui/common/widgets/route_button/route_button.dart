import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';

class RouteButton extends StatelessWidget {
  final String text;
  final Widget destinationPage;
  final Route Function(Widget) transitionBuilder;

  const RouteButton({
    super.key,
    required this.text,
    required this.destinationPage,
    required this.transitionBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(transitionBuilder(destinationPage));
      },
      child: Text(text, style: textStyleText(context),),
    );
  }
}
