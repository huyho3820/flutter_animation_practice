import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/splash_screen_animation/splash_screen_one.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenAnimationTwo extends StatefulWidget {
  const SplashScreenAnimationTwo({super.key});

  @override
  State<SplashScreenAnimationTwo> createState() =>
      _SplashScreenAnimationTwoState();
}

class _SplashScreenAnimationTwoState extends State<SplashScreenAnimationTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Suppose this is an app in your Phone\'s Screen page',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            OpenContainer(
              closedBuilder: (_, openContainer) {
                return const SizedBox(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: Text(
                      'App Logo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
              openColor: const Color(0xff412EEF),
              closedElevation: 20,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              transitionDuration: const Duration(milliseconds: 700),
              openBuilder: (_, closeContainer) =>
                  const SecondSplashScreenClass(),
            )
          ],
        ),
      ),
    );
  }
}

class SecondSplashScreenClass extends StatefulWidget {
  const SecondSplashScreenClass({super.key});

  @override
  State<SecondSplashScreenClass> createState() =>
      _SecondSplashScreenClassState();
}

class _SecondSplashScreenClassState extends State<SecondSplashScreenClass>
    with TickerProviderStateMixin {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(PageTransition(
            child: const ThirdPage(), type: PageTransitionType.bottomToTop));
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff412EEF),
      body: Center(
        child: DefaultTextStyle(
            style: const TextStyle(fontSize: 30.0),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Your App\'s Name',
                    speed: const Duration(milliseconds: 150))
              ],
              isRepeatingAnimation: false,
              repeatForever: false,
              displayFullTextOnTap: false,
            )),
      ),
    );
  }
}
