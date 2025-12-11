import 'package:flutter/material.dart';

import '../../theme.dart';


class HomePage extends StatefulWidget {
  final ScrollController? scrollController;

  const HomePage({
    super.key,
     this.scrollController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_updateScrollOffset);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_updateScrollOffset);
    super.dispose();
  }

  void _updateScrollOffset() {

    // Vérifiez si scrollController n'est pas null avant d'accéder à offset
    if (widget.scrollController != null) {
      setState(() {
        _scrollOffset = widget.scrollController!.offset;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ludovic SPYSSCHAERT",
              textAlign: TextAlign.center,
              style: titleStyleLarge(context)
              ),
            const SizedBox(height: 40),

            Text(
              "Développeur web et web mobile",
              textAlign: TextAlign.center,
              style: titleStyleLarge(context)

              ),

            const SizedBox(height: 50),

            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 50,
              runSpacing: 20,
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage("assets/images/ludo.png"),
                ),


              ],
            ),
            const SizedBox(height: 50),

            Text(
              "Spécialisé en développement flutter web et mobile",
              textAlign: TextAlign.center,
              style: titleStyleMedium(context),

              ),
          ],
        ),
      ),
    );
  }

}
