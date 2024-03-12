import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';
import 'package:mon_site_cv/ui/home_page/home_page.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: theme.primaryColor,
      body:
       const SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           HomePage(),
         ],
       ),

      ),
       );
  }
}
