import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

// import this Package in pubspec.yaml file dependencies:
// animations:

class OpenContainerTransition extends StatefulWidget {
  const OpenContainerTransition({super.key});

  @override
  State<OpenContainerTransition> createState() =>
      _OpenContainerTransitionState();
}

class _OpenContainerTransitionState extends State<OpenContainerTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OpenContainer(
          closedBuilder: (_, openContainer) {
            return Container(
              height: 200,
              width: 200,
              color: Colors.deepPurpleAccent,
              child: IconButton(
                  onPressed: openContainer,
                  icon: Icon(Icons.arrow_forward,
                      size: 30, color: Colors.black.withOpacity(0.8))),
            );
          },
          closedElevation: 2.0,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          openBuilder: (_, closeContainer) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: const Text('Go back'),
                leading: IconButton(
                    onPressed: closeContainer,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
