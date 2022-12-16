import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: Animator<double>(
            cycles: 0,
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 0, end: 15.0),
            builder: (context, animatorState, child) {
              return Container(
                margin: EdgeInsets.all(animatorState.value),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFF5757),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFFFF5757).withOpacity(0.5),
                          offset: const Offset(0, 5),
                          blurRadius: 30)
                    ]),
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
