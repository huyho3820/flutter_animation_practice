import 'package:flutter/material.dart';

class BouncingTextAnimation extends StatefulWidget {
  const BouncingTextAnimation({super.key});

  @override
  State<BouncingTextAnimation> createState() => _BouncingTextAnimationState();
}

class _BouncingTextAnimationState extends State<BouncingTextAnimation> {
  bool animated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
                style: animated
                    ? const TextStyle(color: Colors.blue, fontSize: 80)
                    : const TextStyle(color: Colors.grey, fontSize: 20),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                child: const Text('bounce')),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    animated = !animated;
                  });
                },
                child: const Text('Animate'))
          ],
        ),
      ),
    );
  }
}
