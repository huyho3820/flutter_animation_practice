import 'dart:math';

import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

/// The difference between onHighlightChanged and onTap
/// onHighlightChanged: triggered when Inkwel is tap
/// onTap: triggered when InkWell is tap and release in bound InkWell size

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with TickerProviderStateMixin {
  late Animation _arrowAnimation;
  late AnimationController _arrowAnimationController;
  bool isTapped = false;

  @override
  void initState() {
    _arrowAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
    super.initState();
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: firstChild(),
      ),
    );
  }

  Widget firstChild() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: () {
        setState(() {
          _arrowAnimationController.isCompleted
              ? _arrowAnimationController.reverse()
              : _arrowAnimationController.forward();
        });
      },
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 45 : 50,
        width: isTapped ? 45 : 50,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  blurRadius: 30,
                  offset: const Offset(5, 5))
            ]),
        child: AnimatedBuilder(
          animation: _arrowAnimation,
          builder: (context, child) => Transform.rotate(
              angle: _arrowAnimation.value,
              child: const Icon(
                Icons.expand_more,
                size: 30.0,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}
