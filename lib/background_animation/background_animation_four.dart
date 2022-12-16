import 'dart:math' as math;

import 'package:flutter/material.dart';

class BGAnimation4 extends StatefulWidget {
  const BGAnimation4({super.key});

  @override
  State<BGAnimation4> createState() => _BGAnimation4State();
}

class _BGAnimation4State extends State<BGAnimation4>
    with SingleTickerProviderStateMixin {
  double radius = 0.0;
  double gap = 10.0;

  late Animation<double> animation;
  late AnimationController aController;

  @override
  void initState() {
    aController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    aController.forward();

    aController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //The animation is stopped at the end.
        aController.reset();
        // reset: Sets the controller's value to [lowerBound],
        // stopping the animation (if in progress), and resetting to its beginning point, or dismissed state.
      } else if (status == AnimationStatus.dismissed) {
        //The animation is stopped at the beginning.
        aController.forward();
      }
    });

    animation = Tween(begin: 0.0, end: gap).animate(aController)
      ..addListener(() {
        setState(() {
          radius = animation.value;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    aController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomPaint(
        //The size that this [CustomPaint] should aim for, given the layout constraints, if there is no child.
        // Defaults to [Size.zero].
        // If there's a child, this is ignored, and the size of the child is used instead.
        size: const Size(double.infinity, double.infinity),
        painter: CircleWavePainter(radius),
      ),
    );
  }
}

class CircleWavePainter extends CustomPainter {
  final double radius;
  var wavePaint;

  CircleWavePainter(this.radius) {
    wavePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width / 2.0;
    double y = size.height / 2.0;
    double maxRadius = logic(x, y);

    var currentRadius = radius;
    while (currentRadius < maxRadius) {
      canvas.drawCircle(Offset(x, y), currentRadius, wavePaint);
      currentRadius += 10.0;
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) {
    return oldDelegate.radius != radius;
  }

  double logic(double x, double y) {
    return math.sqrt(x * x + y * y);
  }
}
