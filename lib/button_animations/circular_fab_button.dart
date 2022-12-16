import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class CircularFabButton extends StatelessWidget {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  CircularFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Container(
        color: const Color(0xFF192A56),
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                if (fabKey.currentState!.isOpen) {
                  fabKey.currentState!.close();
                } else {
                  fabKey.currentState!.open();
                }
              },
              child: const Text(
                'Toggle menu programatically',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
      floatingActionButton: FabCircularMenu(
          key: fabKey,
          // cannot be 'Alignment.center'
          alignment: Alignment.bottomRight,
          ringColor: Colors.white.withAlpha(25),
          ringDiameter: 500.0,
          ringWidth: 150.0,
          fabSize: 64.0,
          fabElevation: 8.0,
          fabIconBorder: const CircleBorder(),
          fabOpenColor: Colors.white,
          fabCloseColor: Colors.white,
          fabColor: Colors.white,
          fabOpenIcon: Icon(
            Icons.menu,
            color: primaryColor,
          ),
          fabCloseIcon: Icon(
            Icons.close,
            color: primaryColor,
          ),
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {
            showSnackBar(context, "The menu is ${isOpen ? "open" : "close"}");
          },
          children: [
            RawMaterialButton(
              onPressed: () {
                showSnackBar(context, "You pressed 1");
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(
                Icons.looks_one,
                color: Colors.white,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                showSnackBar(context, "You pressed 2");
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(
                Icons.looks_two,
                color: Colors.white,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                showSnackBar(context, "You pressed 3");
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(
                Icons.looks_3,
                color: Colors.white,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                showSnackBar(context, "You pressed four");
                fabKey.currentState!.close();
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(
                Icons.looks_4,
                color: Colors.white,
              ),
            ),
          ]),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }
}
