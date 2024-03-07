import 'package:flutter/material.dart';

class ButtonRoute extends StatefulWidget {
  final String text;
  const ButtonRoute({Key? key, required this.text}) : super(key: key);

  @override
  _ButtonRouteState createState() => _ButtonRouteState();
}

class _ButtonRouteState extends State<ButtonRoute>
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

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  void _animate() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animate,
      child: Stack(
        children: [
          ClipOval(
            child: Container(
              width: 35.0 + (15.0 * (1 - _animation.value)),
              height: 35.0 * (1 - _animation.value),
              color: Colors.blue,
            ),
          ),
          Center(
            child: Opacity(
              opacity: _animation.value,
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
