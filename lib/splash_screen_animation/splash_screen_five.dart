import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/page_transitions/slide_transition.dart';

class SplashScreenAnimationFive extends StatefulWidget {
  const SplashScreenAnimationFive({super.key});

  @override
  State<SplashScreenAnimationFive> createState() =>
      _SplashScreenAnimationFourState();
}

class _SplashScreenAnimationFourState extends State<SplashScreenAnimationFive> {
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
              openBuilder: (_, closeContainer) => const FifthSplashScreen(),
            )
          ],
        ),
      ),
    );
  }
}

class FifthSplashScreen extends StatefulWidget {
  const FifthSplashScreen({super.key});

  @override
  State<FifthSplashScreen> createState() => _FifthSplashScreenState();
}

class _FifthSplashScreenState extends State<FifthSplashScreen> {
  bool a = false;

  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 700),
      () {
        setState(() {
          a = !a;
        });
      },
    );

    Timer(
      const Duration(milliseconds: 2000),
      () {
        Navigator.pushReplacement(
            context, SlideTransitionAnimation(page: const SecondPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: a ? width : 0,
            height: height,
            color: Colors.black,
          ),
          const Center(
            child: Text(
              'App\'s Name',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation({
    required this.page,
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastLinearToSlowEaseIn);
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), end: const Offset(0, 0))
                    .animate(animation),
                //textDirection: TextDirection.rtl,
                child: page,
              );
            });
}
