import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FadeTextAnimation extends StatefulWidget {
  const FadeTextAnimation({super.key});

  @override
  State<FadeTextAnimation> createState() => _FadeTextAnimationState();
}

class _FadeTextAnimationState extends State<FadeTextAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: DefaultTextStyle(
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  FadeAnimatedText('do IT'),
                  FadeAnimatedText('do it RIGHT'),
                  FadeAnimatedText('do it RIGHT NOW!!!')
                ])),
      ),
    );
  }
}
