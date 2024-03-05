import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('spysschaert', style: titleStyleMedium(context),)
        ],
      ),
    );
  }
}
