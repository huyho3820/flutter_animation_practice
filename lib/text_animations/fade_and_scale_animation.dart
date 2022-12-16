import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AllAnimatedTextKit extends StatefulWidget {
  const AllAnimatedTextKit({super.key});

  @override
  State<AllAnimatedTextKit> createState() => _AllAnimatedTextKitState();
}

class _AllAnimatedTextKitState extends State<AllAnimatedTextKit> {
  var colorizeColors = [Colors.purple, Colors.blue, Colors.yellow, Colors.red];

  var colorizeTextStyle = const TextStyle(
    fontSize: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: const TextStyle(fontSize: 30, color: Colors.amber),
              child: AnimatedTextKit(
                  pause: const Duration(milliseconds: 1500),
                  animatedTexts: [
                    FadeAnimatedText('Fade First',
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    ScaleAnimatedText('Then Scale',
                        textStyle: const TextStyle(
                          fontSize: 70,
                        )),
                    RotateAnimatedText('AWESOME'),
                    RotateAnimatedText('OPTIMISTIC'),
                    TyperAnimatedText('It is not enough to do you'),
                    TypewriterAnimatedText('Design first, then code'),
                    ColorizeAnimatedText('Viet Huy',
                        textStyle: colorizeTextStyle,
                        //colors list should contains at least two values.
                        colors: colorizeColors),
                    FlickerAnimatedText('Night Vibes On')
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true),
            ),
            SizedBox(
              width: 350.0,
              child: TextLiquidFill(
                text: 'LIQUIDY',
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.redAccent,
                textStyle: const TextStyle(
                    fontSize: 80.0, fontWeight: FontWeight.bold),
                boxHeight: 300,
                loadDuration: const Duration(seconds: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
