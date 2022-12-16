import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/splash_screen_animation/splash_screen_one.dart';

class SplashScreenAnimationThree extends StatefulWidget {
  const SplashScreenAnimationThree({super.key});

  @override
  State<SplashScreenAnimationThree> createState() =>
      _SplashScreenAnimationThreeState();
}

class _SplashScreenAnimationThreeState
    extends State<SplashScreenAnimationThree> {
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
              openColor: Colors.white,
              closedElevation: 20,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              transitionDuration: const Duration(milliseconds: 700),
              openBuilder: (_, closeContainer) => const ThirdSplashScreen(),
            )
          ],
        ),
      ),
    );
  }
}

class ThirdSplashScreen extends StatefulWidget {
  const ThirdSplashScreen({super.key});

  @override
  State<ThirdSplashScreen> createState() => _ThirdSplashScreenState();
}

class _ThirdSplashScreenState extends State<ThirdSplashScreen> {
  bool a = false;
  bool b = false;
  bool c = false;

  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 400),
      () {
        setState(() {
          print('a is set after: 400');
          a = true;
        });
      },
    );

    Timer(
      const Duration(milliseconds: 2300),
      () {
        setState(() {
          print('b is set after: 2400');
          b = true;
        });
      },
    );

    Timer(
      const Duration(milliseconds: 3000),
      () {
        setState(() {
          print('c is set after: 3000');
          c = true;
        });
      },
    );

    Timer(
      const Duration(milliseconds: 4000),
      () {
        Navigator.of(context).pushReplacement(
            ThisIsFadeRoute(page: const ThirdPage(), route: const ThirdPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.elasticOut,
              height: a ? h / 2 : 20,
              width: 20,
              color: Colors.transparent,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.fastLinearToSlowEaseIn,
              height: b ? 80 : 20,
              width: b ? 200 : 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: b
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: Center(
                  child: c
                      ? AnimatedTextKit(
                          isRepeatingAnimation: false,
                          animatedTexts: [
                              FadeAnimatedText('App Name',
                                  duration: const Duration(milliseconds: 1700),
                                  textStyle: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700))
                            ])
                      : const SizedBox()),
            )
          ],
        ),
      ),
    );
  }
}
