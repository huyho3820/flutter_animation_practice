import 'dart:math';

import 'package:flutter/material.dart';

class SpinnerLoadingAnimation extends StatefulWidget {
  const SpinnerLoadingAnimation({super.key});

  @override
  State<SpinnerLoadingAnimation> createState() =>
      _SpinnerLoadingAnimationState();
}

class _SpinnerLoadingAnimationState extends State<SpinnerLoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  late AnimationController fifthController;
  late Animation<double> fifthAnimation;

  @override
  void initState() {
    firstController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));

    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(firstController)
      ..addListener(() {
        setState(() {});
      });

    secondController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    secondAnimation =
        Tween<double>(begin: -pi, end: pi).animate(secondController)
          ..addListener(() {
            setState(() {});
          });

    thirdController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    thirdAnimation = Tween<double>(begin: -pi, end: pi).animate(thirdController)
      ..addListener(() {
        setState(() {});
      });

    fourthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fourthAnimation =
        Tween<double>(begin: -pi, end: pi).animate(fourthController)
          ..addListener(() {
            setState(() {});
          });

    fifthController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fifthAnimation = Tween<double>(begin: -pi, end: pi).animate(fifthController)
      ..addListener(() {
        setState(() {});
      });

    firstController.repeat();
    secondController.repeat();
    thirdController.repeat();
    fourthController.repeat();
    fifthController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
