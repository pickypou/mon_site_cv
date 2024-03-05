
import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';

class ButtonRoute extends StatelessWidget {
  const ButtonRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      width: 50,

        borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(
    color: theme.secondaryHeaderColor
    )



  }
}
