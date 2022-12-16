import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class BGAnimation5 extends StatefulWidget {
  const BGAnimation5({super.key});

  @override
  State<BGAnimation5> createState() => _BGAnimation5State();
}

class _BGAnimation5State extends State<BGAnimation5> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          key: UniqueKey(),
          child: Center(
            child: CircularParticle(
              awayRadius: 80,
              numberOfParticles: 200,
              speedOfParticles: 1,
              height: screenHeight,
              width: screenWidth,
              onTapAnimation: true,
              particleColor: Colors.pink.withAlpha(150),
              awayAnimationDuration: const Duration(milliseconds: 600),
              maxParticleSize: 8,
              isRandSize: true,
              isRandomColor: true,
              randColorList: [
                Colors.red.withAlpha(210),
                Colors.white.withAlpha(210),
                Colors.yellow.withAlpha(210),
                Colors.green.withAlpha(210)
              ],
              awayAnimationCurve: Curves.easeInOutBack,
              enableHover: true,
              hoverColor: Colors.white,
              hoverRadius: 90,
              connectDots: false,
            ),
          ),
        ),
      ),
    );
  }
}
