import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/splash_screen_animation/splash_screen_one.dart';

class SplashScreenAnimationFour extends StatefulWidget {
  const SplashScreenAnimationFour({super.key});

  @override
  State<SplashScreenAnimationFour> createState() =>
      _SplashScreenAnimationFourState();
}

class _SplashScreenAnimationFourState extends State<SplashScreenAnimationFour> {
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
              openBuilder: (_, closeContainer) => const ForthSplashScreen(),
            )
          ],
        ),
      ),
    );
  }
}

class ForthSplashScreen extends StatefulWidget {
  const ForthSplashScreen({super.key});

  @override
  State<ForthSplashScreen> createState() => _ForthSplashScreenState();
}

class _ForthSplashScreenState extends State<ForthSplashScreen> {
  bool isBlackStyle = false;
  final blackSyle = const TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      wordSpacing: 2);

  final whiteStyle = const TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      wordSpacing: 2);

  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 500),
      () {
        for (int i = 0; i < 5; i++) {
          Timer(Duration(milliseconds: 700 * (i + 1)), () {
            setState(() {
              isBlackStyle = !isBlackStyle;
            });
          });
        }
      },
    );
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
            ThisIsFadeRoute(page: const ThirdPage(), route: const ThirdPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: isBlackStyle ? Colors.amber : Colors.black,
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              height: isBlackStyle ? 0 : screenHeight,
              width: isBlackStyle ? 0 : screenWidth,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: isBlackStyle ? 0 : 800),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isBlackStyle ? 99 : 2),
                color: Colors.amber,
              ),
            ),
          ),
          Center(
            child: AnimatedContainer(
              height: isBlackStyle ? screenHeight : 0,
              width: isBlackStyle ? screenWidth : 0,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: isBlackStyle ? 800 : 0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(isBlackStyle ? 2 : 99)),
            ),
          ),
          Center(
            child: AnimatedDefaultTextStyle(
                style: isBlackStyle ? whiteStyle : blackSyle,
                duration: const Duration(seconds: 2),
                curve: Curves.fastLinearToSlowEaseIn,
                child: const Text('App Name')),
          )
        ],
      ),
    );
  }
}
