import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatefulWidget {
  const SimpleButton({super.key});

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            simpleButton1(),
            const SizedBox(
              height: 30,
            ),
            AnimatedButton(
              onPressed: () {},
              color: Colors.blue,
              enabled: true,
              shadowDegree: ShadowDegree.light,
              child: const Text(
                'Simple Button 2',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell simpleButton1() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: () {},
      child: AnimatedContainer(
        margin: EdgeInsets.only(top: isTapped ? 5 : 0),
        height: 60,
        width: 180,
        padding: EdgeInsets.only(bottom: isTapped ? 0 : 5),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
          child: const Center(
            child: Text(
              'Simple Button 1',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
