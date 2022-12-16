import 'package:flutter/material.dart';

class ResponsiveIcon extends StatefulWidget {
  const ResponsiveIcon({super.key});

  @override
  State<ResponsiveIcon> createState() => _ResponsiveIconState();
}

class _ResponsiveIconState extends State<ResponsiveIcon> {
  final double _counter = 0;

  bool tap = true;
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onHighlightChanged: (value) {
            tap = !value;
            show = false;
            if (tap == true) {
              //
            }
          },
        ),
      ),
    );
  }
}
