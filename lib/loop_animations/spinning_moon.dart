import 'dart:math' as math;

import 'package:flutter/material.dart';

class SpinningMoon extends StatefulWidget {
  const SpinningMoon({super.key});

  @override
  State<SpinningMoon> createState() => _SpinningMoonState();
}

class _SpinningMoonState extends State<SpinningMoon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) => Transform.rotate(
                angle: _animationController.value * 2 * math.pi,
                child: child,
              ),
              child: Image.asset('assets/images/moon.jpg'),
            ),
          ),
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.amber.withOpacity(1),
                        Colors.amber.withOpacity(1),
                        Colors.amber.withOpacity(.05),
                        Colors.amber.withOpacity(.05),
                        Colors.amber.withOpacity(.1),
                        Colors.amber.withOpacity(.2),
                        Colors.amber.withOpacity(.3),
                        Colors.amber.withOpacity(.4),
                        Colors.amber.withOpacity(.5),
                        Colors.amber.withOpacity(.6),
                        Colors.amber.withOpacity(.7),
                        Colors.amber.withOpacity(.8),
                        Colors.amber.withOpacity(.9),
                        Colors.amber.withOpacity(.9),
                        Colors.amber.withOpacity(1),
                        Colors.amber.withOpacity(1),
                      ])),
            ),
          )
        ],
      ),
    );
  }
}
