import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TextScrollAnimation extends StatefulWidget {
  const TextScrollAnimation({super.key});

  @override
  State<TextScrollAnimation> createState() => _TextScrollAnimationState();
}

class _TextScrollAnimationState extends State<TextScrollAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Marquee(
        text:
            'Hello everyone, today i will show you how to work with animation. Firstly, We dive into Implicit Animation',
        style: const TextStyle(
            fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold),
        //This marquee fades the edges while scrolling
        //The fraction of the [Marquee] that will be faded on the left or top.
        fadingEdgeStartFraction: 0.2,
        //that will be faded on the right or down
        fadingEdgeEndFraction: 0.2,
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 50,
        //The scrolling velocity in pixels per second. (scroll speed)
        velocity: 100,
        //After each round, a pause of this duration occurs.
        pauseAfterRound: const Duration(seconds: 3),
        //In between rounds, the marquee stops at this position.
        //This parameter is especially useful if the marquee pauses after rounds
        //and some other widgets are stacked on top of the marquee and block the sides, like fading gradients.
        startPadding: 10,
        //At the start of each round, the scrolling speed gains momentum for this duration.
        //This parameter is only useful if you embrace a pause after every round.
        // (A marquee that slowly accelerates in Duration after pauseAfterRound duration.)
        accelerationDuration: const Duration(seconds: 1),
        accelerationCurve: Curves.bounceOut,
        //How long the deceleration takes.
        //At the end of each round, the scrolling speed gradually comes to a halt in this duration.
        decelerationDuration: const Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
        numberOfRounds: 3,
      ),
    );
  }
}
