import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_practice/background_animation/background_animation_two.dart';
import 'package:flutter_animation_practice/demo/animated_widget_clipper.dart';
import 'package:flutter_animation_practice/demo/demo_mini_game.dart';
import 'package:flutter_animation_practice/icon_animations/controllable_heart_beat.dart';
import 'package:flutter_animation_practice/loop_animations/ripple_animation.dart';
import 'package:rive/rive.dart';

class DemoHomeScreen extends StatefulWidget {
  const DemoHomeScreen({super.key});

  @override
  State<DemoHomeScreen> createState() => _DemoHomeScreenState();
}

class _DemoHomeScreenState extends State<DemoHomeScreen>
    with TickerProviderStateMixin {
  List<SMIInput<bool>?> inputs = [];
  List<Artboard> artboards = [];

  List<String> assetPaths = [
    'assets/rive/composer.riv',
    'assets/rive/fire.riv',
    'assets/rive/land.riv',
    'assets/rive/mediation.riv',
    'assets/rive/profile.riv'
  ];

  List<Widget> bodyContentList = [
    const AnimationBG2(),
    const ControllableHeartBeat(),
    const AnimatedWidgetClipper(),
    const RippleAnimation(),
    const MiniGame()
  ];

  int currentActiveIndex = 0;

  initializeArtboard() async {
    for (var path in assetPaths) {
      final data = await rootBundle.load(path);

      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      SMIInput<bool>? input;

      final controller =
          StateMachineController.fromArtboard(artboard, "State Machine 1");

      if (controller != null) {
        artboard.addController(controller);
        input = controller.findInput<bool>("status");
        input!.value = true;
      }
      inputs.add(input);
      artboards.add(artboard);
    }
  }

  @override
  void didChangeDependencies() async {
    await initializeArtboard();
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: bodyContentList[currentActiveIndex],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: artboards.map<Widget>((artboard) {
            final index = artboards.indexOf(artboard);
            return BottomAppBarItem(
                artboard: artboard,
                currentIndex: currentActiveIndex,
                tabIndex: index,
                input: inputs[index],
                onPressed: () {
                  setState(() {
                    currentActiveIndex = index;
                  });
                });
          }).toList(),
        ),
      ),
    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  final Artboard? artboard;
  final VoidCallback onPressed;
  final int currentIndex;
  final int tabIndex;
  final SMIInput<bool>? input;

  const BottomAppBarItem(
      {super.key,
      required this.artboard,
      required this.onPressed,
      required this.currentIndex,
      required this.tabIndex,
      required this.input});

  @override
  Widget build(BuildContext context) {
    if (input != null) {
      input!.value = currentIndex == tabIndex;
    }
    return SizedBox(
      height: 40,
      width: 40,
      child: GestureDetector(
        onTap: onPressed,
        child: artboard == null ? const SizedBox() : Rive(artboard: artboard!),
      ),
    );
  }
}
