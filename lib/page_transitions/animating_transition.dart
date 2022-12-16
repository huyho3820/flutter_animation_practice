import 'dart:async';

import 'package:flutter/material.dart';

class AnimatingTransition extends StatefulWidget {
  const AnimatingTransition({super.key});

  @override
  State<AnimatingTransition> createState() => _AnimatingTransitionState();
}

class _AnimatingTransitionState extends State<AnimatingTransition>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
              context,
              AnimatingRoute(
                  page: const Destination(), route: const Destination()));
          Timer(
            const Duration(milliseconds: 300),
            () {
              scaleController.reset();
            },
          );
        }
      });

    scaleAnimation = Tween(begin: 0.0, end: 10.0).animate(scaleController);

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
      body: Center(
        child: InkWell(
          onTap: () {
            scaleController.forward();
          },
          child: Container(
            width: 100,
            height: 100,
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: AnimatedBuilder(
              animation: scaleAnimation,
              builder: (context, child) => Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Go back'),
      ),
    );
  }
}

class AnimatingRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  AnimatingRoute({required this.page, required this.route})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                page,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation,
                  child: route,
                ));
}
