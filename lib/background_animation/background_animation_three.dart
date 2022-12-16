import 'package:flutter/material.dart';

Color smalt = const Color(0xff121856);
Color oldRose = const Color(0xffD23756);

class BGAnimation3 extends StatefulWidget {
  const BGAnimation3({super.key});

  @override
  State<BGAnimation3> createState() => _BGAnimation3State();
}

class _BGAnimation3State extends State<BGAnimation3>
    with TickerProviderStateMixin {
  late Animation<double> bAnimation;

  late AnimationController bController;

  AlignmentTween aTop =
      AlignmentTween(begin: Alignment.topRight, end: Alignment.topLeft);

  AlignmentTween aBot =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomLeft);

  Animatable<Color?> darkBackground = TweenSequence([
    TweenSequenceItem(
        tween: ColorTween(
            begin: smalt.withOpacity(.8), end: oldRose.withOpacity(.8)),
        weight: .5),
    TweenSequenceItem(
        tween: ColorTween(
            begin: oldRose.withOpacity(.8), end: smalt.withOpacity(.8)),
        weight: .5),
  ]);

  Animatable<Color?> normalBackground = TweenSequence([
    TweenSequenceItem(
        tween: ColorTween(
            begin: smalt.withOpacity(.6), end: oldRose.withOpacity(.6)),
        weight: .5),
    TweenSequenceItem(
        tween: ColorTween(
            begin: oldRose.withOpacity(.6), end: smalt.withOpacity(.6)),
        weight: .5),
  ]);

  Animatable<Color?> lightBackground = TweenSequence([
    TweenSequenceItem(
        tween: ColorTween(
            begin: smalt.withOpacity(.4), end: oldRose.withOpacity(.4)),
        weight: .5),
    TweenSequenceItem(
        tween: ColorTween(
            begin: oldRose.withOpacity(.4), end: smalt.withOpacity(.4)),
        weight: .5),
  ]);

  @override
  void initState() {
    bController =
        AnimationController(vsync: this, duration: const Duration(seconds: 7))
          ..repeat();

    bAnimation = CurvedAnimation(parent: bController, curve: Curves.easeIn);
    super.initState();
  }

  @override
  void dispose() {
    bController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: bAnimation,
      builder: (context, child) {
        return Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  //evaluate: The current value of this object for the given [Animation]
                  begin: aTop.evaluate(bAnimation),
                  end: aBot.evaluate(bAnimation),
                  colors: [
                darkBackground.evaluate(bAnimation)!,
                normalBackground.evaluate(bAnimation)!,
                lightBackground.evaluate(bAnimation)!
              ])),
        );
      },
    );
  }
}
