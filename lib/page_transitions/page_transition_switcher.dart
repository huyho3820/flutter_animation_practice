import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CustomPageTransitionSwitcher extends StatefulWidget {
  const CustomPageTransitionSwitcher({super.key});

  @override
  State<CustomPageTransitionSwitcher> createState() =>
      _CustomPageTransitionSwitcherState();
}

class _CustomPageTransitionSwitcherState
    extends State<CustomPageTransitionSwitcher> {
  bool onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PageTransitionSwitcher(
              duration: const Duration(seconds: 5),
              reverse: !onFirstPage,
              transitionBuilder: (child, animation, secondaryAnimation) {
                return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.vertical,
                    child: child);
              },
              child: onFirstPage
                  ? Container(
                      key: UniqueKey(),
                      color: Colors.green,
                      height: 200,
                      width: 320,
                    )
                  : Container(
                      key: UniqueKey(),
                      color: Colors.pinkAccent,
                      height: 200,
                      width: 320,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      onFirstPage = !onFirstPage;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                          )
                        ]),
                    child: const Center(
                      child: Text(
                        'Switch',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
