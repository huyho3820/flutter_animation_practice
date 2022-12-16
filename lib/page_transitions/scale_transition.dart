import 'package:flutter/material.dart';

class CustomScaleTransition extends StatelessWidget {
  const CustomScaleTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    ScaleTransition1(
                        const SecondPage(), Alignment.bottomCenter)),
                child: const Text('Tap to View Scale Animation 1')),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    ScaleTransition1(const SecondPage(), Alignment.topCenter)),
                child: const Text('Tap to View Scale Animation 2')),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    ScaleTransition1(const SecondPage(), Alignment.bottomLeft)),
                child: const Text('Tap to View Scale Animation 3')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    ScaleTransition1(
                        const SecondPage(), Alignment.bottomRight)),
                child: const Text('Tap to View Scale Animation 4')),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    ScaleTransition1(const SecondPage(), Alignment.center)),
                child: const Text('Tap to View Scale Animation 5')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    ScaleTransition1(
                        const SecondPage(), Alignment.centerRight)),
                child: const Text('Tap to View Scale Animation 6')),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    ScaleTransition1(const SecondPage(), Alignment.centerLeft)),
                child: const Text('Tap to View Scale Animation 7')),
          ],
        ),
      ),
    );
  }
}

class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;
  final Alignment alignment;

  ScaleTransition1(this.page, this.alignment)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return ScaleTransition(
                scale: animation,
                alignment: alignment,
                child: child,
              );
            });
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Scale Transition'),
      ),
    );
  }
}
