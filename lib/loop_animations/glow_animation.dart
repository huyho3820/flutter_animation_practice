import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class GlowAnimation extends StatefulWidget {
  const GlowAnimation({super.key});

  @override
  State<GlowAnimation> createState() => _GlowAnimationState();
}

class _GlowAnimationState extends State<GlowAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AvatarGlow(
            glowColor: Colors.white,
            endRadius: 120,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 500),
            repeat: true,
            curve: Curves.easeOutQuad,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(99),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.blue,
                size: 40,
              ),
            )),
      ),
    );
  }
}
