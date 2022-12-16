import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class HeartBeatTransition extends StatefulWidget {
  const HeartBeatTransition({super.key});

  @override
  State<HeartBeatTransition> createState() => _HeartBeatTransitionState();
}

class _HeartBeatTransitionState extends State<HeartBeatTransition> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: width / 2.7,
                width: width / 2.7,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 1000),
                  cycles: 0,
                  curve: Curves.elasticIn,
                  tween: Tween<double>(begin: 20.0, end: 25.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.favorite,
                    size: animatorState.value * 5,
                    color: const Color(0xFFFF5757),
                  ),
                ),
              ),
              SizedBox(
                height: width / 2.7,
                width: width / 2.7,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 1000),
                  cycles: 0,
                  curve: Curves.elasticInOut,
                  tween: Tween<double>(begin: 20.0, end: 25.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.favorite,
                    size: animatorState.value * 5,
                    color: const Color(0xFFFF5757),
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: width / 2.7,
                width: width / 2.7,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 1000),
                  cycles: 0,
                  curve: Curves.bounceOut,
                  tween: Tween<double>(begin: 20.0, end: 25.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.favorite,
                    size: animatorState.value * 5,
                    color: const Color(0xFFFF5757),
                  ),
                ),
              ),
              SizedBox(
                height: width / 2.7,
                width: width / 2.7,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 1000),
                  cycles: 0,
                  curve: Curves.elasticOut,
                  tween: Tween<double>(begin: 20.0, end: 25.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.favorite,
                    size: animatorState.value * 5,
                    color: const Color(0xFFFF5757),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
