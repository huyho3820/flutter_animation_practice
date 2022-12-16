import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WavyTextAnimation extends StatefulWidget {
  const WavyTextAnimation({super.key});

  @override
  State<WavyTextAnimation> createState() => _WavyTextAnimationState();
}

class _WavyTextAnimationState extends State<WavyTextAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: DefaultTextStyle(
            style: const TextStyle(fontSize: 30.0),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Hello friend'),
                WavyAnimatedText('Look at the waves')
              ],
              repeatForever: true,
              isRepeatingAnimation: true,
            )),
      ),
    );
  }
}
