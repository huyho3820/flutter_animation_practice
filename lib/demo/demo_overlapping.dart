import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with WidgetsBindingObserver {
  final containerKey1 = GlobalKey();
  final containerKey2 = GlobalKey();

  Alignment box2Align = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                key: containerKey1,
                color: Colors.pink,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Align(
              alignment: box2Align,
              child: Transform.translate(
                offset: const Offset(10.0, 100.0),
                child: Container(
                  key: containerKey2,
                  color: Colors.purple.withOpacity(0.75),
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            // Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  child: const Text('Move containers'),
                  onPressed: () => setState(() {
                    if (box2Align == Alignment.topRight) {
                      box2Align = Alignment.topLeft;
                    } else {
                      box2Align = Alignment.topRight;
                    }
                  }),
                ),
                ElevatedButton(
                  onPressed: _onCheckTap,
                  child: const Text('Check if boxesCollide'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onCheckTap() {
    RenderBox box1 =
        containerKey1.currentContext!.findRenderObject() as RenderBox;
    RenderBox box2 =
        containerKey2.currentContext!.findRenderObject() as RenderBox;

    final size1 = box1.size;
    final size2 = box2.size;
    print('size2 width: ${size2.width}');

    final position1 = box1.localToGlobal(Offset.zero);
    print('position1: $position1');
    final position2 = box2.localToGlobal(Offset.zero);
    print('position2: $position2');

    final collide = (position1.dx < position2.dx + size2.width &&
        position1.dx + size1.width > position2.dx &&
        position1.dy < position2.dy + size2.height &&
        position1.dy + size1.height > position2.dy);

    print('Containers collide: $collide');
  }
}
