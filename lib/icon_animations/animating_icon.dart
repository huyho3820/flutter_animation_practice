import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class AnimatingIcon extends StatefulWidget {
  const AnimatingIcon({super.key});

  @override
  State<AnimatingIcon> createState() => _AnimatingIconState();
}

class _AnimatingIconState extends State<AnimatingIcon> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.amber,
          height: width / 2.7,
          width: width / 2.7,
          child: Animator<double>(
            duration: const Duration(milliseconds: 1000),
            cycles: 0,
            curve: Curves.easeInOut,
            tween: Tween(begin: 15.0, end: 25.0),
            builder: (context, animatorState, child) => Icon(
              Icons.audiotrack,
              size: animatorState.value * 5,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
