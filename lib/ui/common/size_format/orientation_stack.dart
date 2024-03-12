import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/size_format/size_extensions.dart';

class OrientationStack extends StatelessWidget {
  final SizeOrientation orientation;
  final List<Widget> children;
  const OrientationStack(
      {super.key, required this.orientation, required this.children});

  @override
  Widget build(BuildContext context) {
    if ((orientation == SizeOrientation.paysage)) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    } else {
      return Column(
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      );
    }
  }
}
