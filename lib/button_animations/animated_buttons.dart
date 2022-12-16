import 'package:flutter/material.dart';

class AnimatedButtons extends StatefulWidget {
  const AnimatedButtons({super.key});

  @override
  State<AnimatedButtons> createState() => _AnimatedButtonsState();
}

class _AnimatedButtonsState extends State<AnimatedButtons> {
  bool isItem1Pressed = true;
  bool isItem2Pressed = true;
  bool isHighlighted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isItem1Pressed = !isItem1Pressed;
                });
              },
              child: AnimatedContainer(
                height: 50,
                width: 50,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black
                              .withOpacity(isItem1Pressed ? 0.2 : 0.0),
                          blurRadius: 20,
                          offset: const Offset(5, 10)),
                    ],
                    color: isItem1Pressed
                        ? Colors.white
                        : Colors.black.withOpacity(0.1)),
                child: Icon(
                  Icons.favorite,
                  color: isItem1Pressed
                      ? Colors.black.withOpacity(0.7)
                      : Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                setState(() {
                  isHighlighted = !isHighlighted;
                });
              },
              onTap: () {
                setState(() {
                  isItem2Pressed = !isItem2Pressed;
                });
              },
              child: AnimatedContainer(
                height: isHighlighted ? 50 : 45,
                width: isHighlighted ? 50 : 45,
                margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(5, 10))
                ], color: Colors.white, shape: BoxShape.circle),
                child: isItem2Pressed
                    ? Icon(
                        Icons.favorite_border,
                        color: Colors.black.withOpacity(0.6),
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.pink.withOpacity(1.0),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
