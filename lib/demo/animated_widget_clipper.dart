import 'package:flutter/material.dart';

class AnimatedWidgetClipper extends StatefulWidget {
  const AnimatedWidgetClipper({super.key});

  @override
  State<AnimatedWidgetClipper> createState() => _AnimatedWidgetClipperState();
}

class _AnimatedWidgetClipperState extends State<AnimatedWidgetClipper>
    with SingleTickerProviderStateMixin {
  final Image starsBackground = Image.asset(
    'assets/images/milky-way.jpeg',
  );
  final Image ufo = Image.asset('assets/images/ufo.png');
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          starsBackground,
          BeamTransition(animation: _animation),
          ufo,
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class BeamTransition extends AnimatedWidget {
  const BeamTransition({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return ClipPath(
      clipper: const BeamClipper(),
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: const [
              Colors.yellow,
              Colors.transparent,
            ],
            stops: [0, animation.value],
          ),
        ),
      ),
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
