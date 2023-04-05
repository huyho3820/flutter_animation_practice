import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/demo/demo_home_page.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationSplashScreen extends StatefulWidget {
  const LottieAnimationSplashScreen({super.key});

  @override
  State<LottieAnimationSplashScreen> createState() =>
      _LottieAnimationSplashScreenState();
}

class _LottieAnimationSplashScreenState
    extends State<LottieAnimationSplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2900),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DemoHomeScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E98D5),
      body: Lottie.asset('assets/lottie/splash_screen.json'),
    );
  }
}
