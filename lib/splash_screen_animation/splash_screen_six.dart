import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SplashScreenAnimationSix extends StatefulWidget {
  const SplashScreenAnimationSix({super.key});

  @override
  State<SplashScreenAnimationSix> createState() =>
      _SplashScreenAnimationFourState();
}

class _SplashScreenAnimationFourState extends State<SplashScreenAnimationSix> {
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
              openBuilder: (_, closeContainer) => const SplashScreen6(),
            )
          ],
        ),
      ),
    );
  }
}

class SplashScreen6 extends StatefulWidget {
  const SplashScreen6({super.key});

  @override
  State<SplashScreen6> createState() => _SplashScreen6State();
}

class _SplashScreen6State extends State<SplashScreen6>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> _animation1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(
      const Duration(seconds: 2),
      () {
        setState(() {
          _fontSize = 1.06;
        });
      },
    );

    Timer(
      const Duration(seconds: 2),
      () {
        setState(() {
          _containerSize = 2;
          _containerOpacity = 1;
        });
      },
    );

    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(context, PageTransition(const SecondPage()));
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / _fontSize,
                  duration: const Duration(milliseconds: 2000)),
              AnimatedOpacity(
                opacity: _textOpacity,
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'Your App\'s Name',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: _animation1.value),
                ),
              )
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: width / _containerSize,
                width: width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  'Your App\'s Logo',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastLinearToSlowEaseIn);
              return Align(
                alignment: Alignment.bottomCenter,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: page,
                ),
              );
            });
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Your App\'s Name',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
