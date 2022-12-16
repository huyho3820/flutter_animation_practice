import 'dart:developer';

import 'package:flutter/material.dart';

class ControllableHeartBeat extends StatefulWidget {
  const ControllableHeartBeat({super.key});

  @override
  State<ControllableHeartBeat> createState() => _ControllableHeartBeatState();
}

class _ControllableHeartBeatState extends State<ControllableHeartBeat>
    with TickerProviderStateMixin {
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  bool isTappped = false;

  @override
  void initState() {
    _heartAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2));

    _heartAnimation = Tween(begin: 120.0, end: 170.0).animate(CurvedAnimation(
        parent: _heartAnimationController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.bounceInOut));

    _heartAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        log("The animation is stopped at the end.");
        _heartAnimationController.reverse();
        log("The animation reversed");
      } else if (status == AnimationStatus.dismissed) {
        log("The animation is stopped at the beginning.");
        _heartAnimationController.forward();
        log("The animation forwaded");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _heartAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return secondChild();
  }

  Widget secondChild() {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: _heartAnimationController,
        builder: (context, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: _heartAnimation.value,
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () => _heartAnimationController.forward(),
                      child: const Text('Start beating')),
                  ElevatedButton(
                      onPressed: () => _heartAnimationController.stop(),
                      child: const Text('Stop beating'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
