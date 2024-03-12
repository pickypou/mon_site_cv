import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/size_format/size_extensions.dart';

class OrientationSizeBox extends StatelessWidget {
  final Size size;
  final Widget? child;
  final double fraction;
  const OrientationSizeBox(
      {super.key, required this.size, this.child, required this.fraction});

  @override
  Widget build(BuildContext context) {
    bool fullHeight = size.orientation() == SizeOrientation.paysage;
    return SizedBox(
      width: size.width * (fullHeight ? fraction : 1),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: child,
      ),
    );
  }
}
