import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SplashScreenAnimationOne extends StatefulWidget {
  const SplashScreenAnimationOne({super.key});

  @override
  State<SplashScreenAnimationOne> createState() =>
      _SplashScreenAnimationOneState();
}

class _SplashScreenAnimationOneState extends State<SplashScreenAnimationOne> {
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
              openBuilder: (_, closeContainer) => const SencondClass(),
            )
          ],
        ),
      ),
    );
  }
}

class SencondClass extends StatefulWidget {
  const SencondClass({super.key});

  @override
  State<SencondClass> createState() => _SencondClassState();
}

class _SencondClassState extends State<SencondClass>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  double _opacity = 0;
  bool _value = true;

  @override
  void initState() {
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addStatusListener((status) {
        //The animation is stopped at the end.
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(ThisIsFadeRoute(
              page: const ThirdPage(), route: const ThirdPage()));
        }
      });

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(
      const Duration(milliseconds: 600),
      () {
        setState(() {
          _opacity = 1.0;
          _value = false;
        });
      },
    );

    Timer(
      const Duration(milliseconds: 2000),
      () {
        setState(() {
          scaleController.forward();
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Center(
                  child: Text(
                    'Here will be your app\'s logo',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _opacity,
              duration: const Duration(milliseconds: 600),
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                height: _value ? 50 : 200,
                width: _value ? 50 : 200,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.deepPurpleAccent.withOpacity(.2),
                          blurRadius: 100,
                          spreadRadius: 10)
                    ],
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(20)),
                duration: const Duration(seconds: 2),
                child: Center(
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurpleAccent),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  ThisIsFadeRoute({required this.page, required this.route})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: animation,
                      child: route,
                    ));
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go back'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
