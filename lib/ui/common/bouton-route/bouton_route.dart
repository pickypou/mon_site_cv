import 'package:flutter/material.dart';
import 'package:mon_site_cv/ui/common/theme/theme.dart';

class ButtonRoute extends StatefulWidget {
  final String text;
  const ButtonRoute({super.key, required this.text});

  @override
  _ButtonRouteState createState() => _ButtonRouteState();
}

class _ButtonRouteState extends State<ButtonRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  void _animate() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animate,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return ClipOval(
            child: Container(
              width: 35.0,
              height: 35.0 * _animation.value,
              color: theme.secondaryHeaderColor,
              child: Center(
                child: _animation.value <= 0.21
                    ? Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: theme.secondaryHeaderColor,
                  ),
                )
                    : const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
