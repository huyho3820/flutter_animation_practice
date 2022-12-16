import 'package:flutter/material.dart';

class CustomFadeTransition extends StatefulWidget {
  const CustomFadeTransition({super.key});

  @override
  State<CustomFadeTransition> createState() => _CustomFadeTransitionState();
}

class _CustomFadeTransitionState extends State<CustomFadeTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () =>
                    Navigator.push(context, FadeRoute1(const SecondPage())),
                child: const Text('Tap to view Fade Animation 1')),
            ElevatedButton(
                onPressed: () =>
                    Navigator.push(context, FadeRoute2(const SecondPage())),
                child: const Text('Tap to View Fade Animation 2'))
          ],
        ),
      ),
    );
  }
}

class FadeRoute1 extends PageRouteBuilder {
  final Widget page;

  FadeRoute1(this.page)
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                page,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation,
                  child: page,
                ));
}

class FadeRoute2 extends PageRouteBuilder {
  final Widget page;

  FadeRoute2(this.page)
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return FadeTransition(
                opacity: animation,
                child: page,
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
        title: const Text('Fade Transition'),
      ),
    );
  }
}
