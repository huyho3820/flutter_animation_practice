import 'package:flutter/material.dart';

class CustomSizeTransition extends StatelessWidget {
  const CustomSizeTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context, SizeTransition1(const SecondPage())),
                child: const Text('Tap To View Size Animation 1')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context, SizeTransition2(const SecondPage())),
                child: const Text('Tap To View Size Animation 2')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context, SizeTransition3(const SecondPage())),
                child: const Text('Tap To View Size Animation 3')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context, SizeTransition4(const SecondPage())),
                child: const Text('Tap To View Size Animation 4')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context, SizeTransition5(const SecondPage())),
                child: const Text('Tap To View Size Animation 5')),
          ],
        ),
      ),
    );
  }
}

class SizeTransition1 extends PageRouteBuilder {
  final Widget page;

  SizeTransition1(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.bottomCenter,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: page,
                ),
              );
            });
}

class SizeTransition2 extends PageRouteBuilder {
  final Widget page;

  SizeTransition2(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.topCenter,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: page,
                ),
              );
            });
}

class SizeTransition3 extends PageRouteBuilder {
  final Widget page;

  SizeTransition3(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.center,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: page,
                ),
              );
            });
}

class SizeTransition4 extends PageRouteBuilder {
  final Widget page;

  SizeTransition4(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.bottomRight,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: page,
                ),
              );
            });
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.centerRight,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: page,
                ),
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
        title: const Text('Size Transition'),
      ),
    );
  }
}
