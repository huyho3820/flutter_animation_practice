import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_practice/background_animation/background_animation_two.dart';
import 'package:flutter_animation_practice/demo/animated_widget_clipper.dart';
import 'package:flutter_animation_practice/demo/demo_mini_game.dart';
import 'package:flutter_animation_practice/icon_animations/controllable_heart_beat.dart';
import 'package:flutter_animation_practice/loop_animations/ripple_animation.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: buildDemoWidget(),
    );
  }

  Scaffold buildDemoWidget() {
    return Scaffold(
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AnimationBG2(),
                        ));
                  },
                  child: const Text(
                      'Preview Implicit Animation mix with Explicit Animation')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ControllableHeartBeat(),
                        ));
                  },
                  child: const Text(
                      'Preview Explicit Animation (Animated Builder)')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AnimatedWidgetClipper(),
                        ));
                  },
                  child: const Text(
                      'Preview Explicit Animation (Animated Widget)')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RippleAnimation(),
                        ));
                  },
                  child: const Text('Preview CustomPainter')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MiniGame(),
                        ));
                  },
                  child: const Text('Demo mini game')),
            ],
          ),
        );
      }),
    );
  }
}
