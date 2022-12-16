import 'package:flutter/material.dart';

class ElevationAnimation extends StatefulWidget {
  const ElevationAnimation({super.key});

  @override
  State<ElevationAnimation> createState() => _ElevationAnimationState();
}

class _ElevationAnimationState extends State<ElevationAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animationController.repeat(reverse: true);
    _animation = Tween(
      begin: 1.0,
      end: 13.0,
    ).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.isDismissed;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: _animation.value + _animation.value,
                        spreadRadius: _animation.value,
                        offset: Offset(_animation.value, _animation.value))
                  ]),
              child: Icon(
                Icons.favorite,
                color: Colors.pink.withOpacity(0.7),
                size: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}
