import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class FloatingIconAnimation extends StatefulWidget {
  const FloatingIconAnimation({super.key});

  @override
  State<FloatingIconAnimation> createState() => _FloatingIconAnimationState();
}

class _FloatingIconAnimationState extends State<FloatingIconAnimation> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: SizedBox(
        height: w / 2.75,
        width: w / 4,
        child: Animator(
          duration: const Duration(milliseconds: 2000),
          cycles: 0,
          tween: Tween(begin: 0, end: 10.0),
          builder: (context, animatorState, child) {
            return Column(
              children: [
                Container(
                  height: animatorState.value * 5,
                ),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.pink.withOpacity(.15),
                        blurRadius: 20,
                        offset: const Offset(0, 5)),
                  ]),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 80,
                  ),
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
