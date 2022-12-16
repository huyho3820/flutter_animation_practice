import 'dart:async';

import 'package:flutter/material.dart';

class AnimationBG1 extends StatefulWidget {
  const AnimationBG1({super.key});

  @override
  State<AnimationBG1> createState() => _AnimationBG1State();
}

class _AnimationBG1State extends State<AnimationBG1>
    with TickerProviderStateMixin {
  List<Color> colorList = [
    const Color(0xff171B70),
    const Color(0xff410D75),
    const Color(0xff032340),
    const Color(0xff050340),
    const Color(0xff2C0340)
  ];

  List<Alignment> alignmentList = [Alignment.topCenter, Alignment.bottomCenter];

  int index = 0;

  Color bottomColor = const Color(0xff092646);
  Color topColor = const Color(0xff410D75);
  Alignment begin = Alignment.bottomCenter;
  Alignment end = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(microseconds: 0),
      () {
        setState(() {
          bottomColor = const Color(0xff33267C);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      onEnd: () {
        setState(() {
          index = index + 1;
          bottomColor = colorList[index % colorList.length];
          topColor = colorList[(index + 1) % colorList.length];
        });
      },
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: begin, end: end, colors: [bottomColor, topColor])),
    );
  }
}
