import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';

class RouteButton extends StatefulWidget {
  final String text;
  const RouteButton({Key? key, required this.text}) : super(key: key);

  @override
  _RouteButtonState createState() => _RouteButtonState();
}

class _RouteButtonState extends State<RouteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(seconds: 2), () {
      _animationController.forward();
    });

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.status == AnimationStatus.completed) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: 35.0 + (15.0 * (1 - _animation.value)),
                  height: 35.0 * (1 - _animation.value),
                  color: theme.secondaryHeaderColor,
                ),
              ),
              Opacity(
                opacity: _animation.value,
                child: Text(
                  widget.text,
                  style: textStyleText(context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
