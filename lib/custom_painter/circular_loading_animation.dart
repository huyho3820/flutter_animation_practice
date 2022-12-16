import 'dart:math';

import 'package:flutter/material.dart';

class CircularLoadingAnimation extends StatefulWidget {
  const CircularLoadingAnimation({super.key});

  @override
  State<CircularLoadingAnimation> createState() =>
      _CircularLoadingAnimationState();
}

class _CircularLoadingAnimationState extends State<CircularLoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  @override
  void initState() {
    firstController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    firstAnimation =
        Tween<double>(begin: -pi, end: pi).animate(firstController);

    secondController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    secondAnimation = Tween<double>(begin: -1, end: -4).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    firstController.repeat();
    secondController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CustomPaint(
            painter: MyCustomPaint(
                startAngle: firstAnimation.value,
                sweepAngle: secondAnimation.value),
          ),
        ),
      ),
    );
  }
}

class MyCustomPaint extends CustomPainter {
  final double startAngle;
  final double sweepAngle;

  MyCustomPaint({required this.startAngle, required this.sweepAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint myCircle = Paint()
      ..color = const Color(0xffCFCDF6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(
        Offset(size.width * .5, size.height * .5), size.width * .5, myCircle);

    Paint myArc = Paint()
      ..color = const Color(0xff420087)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(Rect.fromLTRB(0, 0, size.width, size.height), startAngle,
        sweepAngle, false, myArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
