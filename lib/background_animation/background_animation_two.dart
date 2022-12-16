import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/demo/implicit_animation_demo.dart';

class AnimationBG2 extends StatefulWidget {
  const AnimationBG2({super.key});

  @override
  State<AnimationBG2> createState() => _AnimationBG2State();
}

class _AnimationBG2State extends State<AnimationBG2>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> topColor;
  late Animation<Color?> bottomColor;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    topColor = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xffd9ed92), end: const Color(0xffb5e48c)),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xffb5e48c), end: const Color(0xff99d98c)),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff99d98c), end: const Color(0xff76c893)),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff76c893), end: const Color(0xff52b69a)),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff52b69a), end: const Color(0xff34a0a4)),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff34a0a4), end: const Color(0xff168aad)),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff168aad), end: const Color(0xff1a759f)),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff1a759f), end: const Color(0xff1e6091)),
          weight: 1.0),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff1e6091), end: const Color(0xff184e77)),
          weight: 1.0),
    ]).animate(controller);

    bottomColor = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff184e77), end: const Color(0xff1e6091)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff1e6091), end: const Color(0xff1a759f)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff1a759f), end: const Color(0xff168aad)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff168aad), end: const Color(0xff34a0a4)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff34a0a4), end: const Color(0xff52b69a)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff52b69a), end: const Color(0xff76c893)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff76c893), end: const Color(0xff99d98c)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xff99d98c), end: const Color(0xffb5e48c)),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(
              begin: const Color(0xffb5e48c), end: const Color(0xffd9ed92)),
          weight: 1),
    ]).animate(controller);
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [topColor.value!, bottomColor.value!])),
            child: Center(
              child: child,
            ),
          );
        },
        child: const ImplicitAnimationDemo(),
      ),
    );
  }
}
