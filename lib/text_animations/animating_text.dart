import 'dart:async';

import 'package:flutter/material.dart';

class CustomAnimatingText extends StatefulWidget {
  const CustomAnimatingText({super.key});

  @override
  State<CustomAnimatingText> createState() => _CustomAnimatingTextState();
}

class _CustomAnimatingTextState extends State<CustomAnimatingText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SlideFadeTransition(
              curve: Curves.elasticOut,
              delayStart: const Duration(milliseconds: 500),
              animationDuration: const Duration(seconds: 5),
              offset: 2.5,
              direction: Direction.horizontal,
              child: Text(
                'Hello! Do you want to learn animation?',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SlideFadeTransition(
                curve: Curves.elasticOut,
                delayStart: const Duration(seconds: 6),
                animationDuration: const Duration(seconds: 3),
                offset: 2.5,
                direction: Direction.vertical,
                child: Text('You don\'t know where to start',
                    style: Theme.of(context).textTheme.displaySmall)),
            const SlideFadeTransition(
                delayStart: Duration(seconds: 9),
                animationDuration: Duration(seconds: 3),
                offset: 2.5,
                child: Text('I\'m here to help you',
                    style: TextStyle(fontSize: 20))),
            SlideFadeTransition(
                curve: Curves.elasticOut,
                delayStart: const Duration(seconds: 13),
                animationDuration: const Duration(seconds: 2),
                offset: -2.5,
                direction: Direction.vertical,
                child: Text(
                    'Just 100\$/month, you will learn everything about Flutter',
                    style: Theme.of(context).textTheme.displaySmall)),
            const SlideFadeTransition(
                curve: Curves.fastLinearToSlowEaseIn,
                delayStart: Duration(seconds: 14),
                animationDuration: Duration(seconds: 3),
                offset: 5,
                child: Text('Contact Viet Huy for more information',
                    style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }
}

enum Direction { vertical, horizontal }

class SlideFadeTransition extends StatefulWidget {
  final Widget child;
  final double offset;
  final Curve curve;
  final Direction direction;
  final Duration delayStart;
  final Duration animationDuration;

  const SlideFadeTransition(
      {super.key,
      required this.child,
      this.offset = 1.0,
      this.curve = Curves.easeIn,
      this.direction = Direction.vertical,
      this.delayStart = const Duration(seconds: 0),
      this.animationDuration = const Duration(milliseconds: 800)});

  @override
  State<SlideFadeTransition> createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animationSlide;

  late AnimationController animationController;

  late Animation<double> animationFade;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);

    if (widget.direction == Direction.vertical) {
      animationSlide = Tween<Offset>(
              begin: Offset(0, widget.offset), end: const Offset(0, 0))
          .animate(CurvedAnimation(
              parent: animationController, curve: widget.curve));
    } else {
      animationSlide = Tween<Offset>(
              begin: Offset(widget.offset, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(
              parent: animationController, curve: widget.curve));
    }

    animationFade = Tween<double>(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: widget.curve));

    Timer(
      widget.delayStart,
      () {
        animationController.forward();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationFade,
      child: SlideTransition(
        position: animationSlide,
        child: widget.child,
      ),
    );
  }
}
