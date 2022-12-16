import 'package:flutter/material.dart';

class RippleAnimationButton extends StatefulWidget {
  const RippleAnimationButton({super.key});

  @override
  State<RippleAnimationButton> createState() => _RippleAnimationButtonState();
}

class _RippleAnimationButtonState extends State<RippleAnimationButton>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              padding: EdgeInsets.all(50.0 * animationController.value),
              decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: Colors.white.withOpacity(0.5)),
              child: child,
            );
          },
          child: Container(
            decoration: const ShapeDecoration(
                color: Colors.white, shape: CircleBorder()),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_today,
                  size: 24,
                )),
          ),
        ),
      ),
    );
  }
}
