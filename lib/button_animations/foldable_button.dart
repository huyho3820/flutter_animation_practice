import 'package:flutter/material.dart';

class FoldableButton extends StatefulWidget {
  const FoldableButton({super.key});

  @override
  State<FoldableButton> createState() => _FoldableButtonState();
}

class _FoldableButtonState extends State<FoldableButton>
    with TickerProviderStateMixin {
  bool isTapped = true;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
        alignment: Alignment.centerRight,
        child: FoldableOptions(),
      ),
    );
  }
}

class FoldableOptions extends StatefulWidget {
  const FoldableOptions({super.key});

  @override
  State<FoldableOptions> createState() => _FoldableOptionsState();
}

class _FoldableOptionsState extends State<FoldableOptions>
    with SingleTickerProviderStateMixin {
  final List<IconData> options = [
    Icons.settings,
    Icons.person,
    Icons.favorite,
    Icons.home,
    Icons.star
  ];

  late Animation<Alignment> firstAnim;
  late Animation<Alignment> secondAnim;
  late Animation<Alignment> thirdAnim;
  late Animation<Alignment> fourthAnim;
  late Animation<Alignment> fifthAnim;
  late Animation<double> verticalPadding;
  late AnimationController controller;
  final duration = const Duration(milliseconds: 190);

  Widget getItem(IconData source) {
    const size = 45.0;
    return GestureDetector(
      onTap: () {
        controller.reverse();
      },
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
            color: Color(0xFFE95A8B),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Icon(
          source,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget buildPrimaryItem(IconData source) {
    const size = 45.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: const Color(0XFFE95A8B),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
                color: const Color(0XFFE95A8B).withOpacity(0.8),
                blurRadius: verticalPadding.value)
          ]),
      child: Icon(
        source,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: duration);

    final anim = CurvedAnimation(parent: controller, curve: Curves.linear);

    firstAnim =
        Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topRight)
            .animate(anim);
    secondAnim =
        Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topLeft)
            .animate(anim);
    thirdAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.centerLeft)
        .animate(anim);
    fourthAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomLeft)
        .animate(anim);
    fifthAnim = Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomRight)
        .animate(anim);

    verticalPadding = Tween<double>(begin: 0, end: 26).animate(anim);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 210,
      margin: const EdgeInsets.only(right: 15),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: [
              Align(
                alignment: firstAnim.value,
                child: getItem(options.elementAt(0)),
              ),
              Align(
                alignment: secondAnim.value,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 37, top: verticalPadding.value),
                  child: getItem(options.elementAt(1)),
                ),
              ),
              Align(
                alignment: thirdAnim.value,
                child: getItem(options.elementAt(2)),
              ),
              Align(
                alignment: fourthAnim.value,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 37, bottom: verticalPadding.value),
                  child: getItem(options.elementAt(3)),
                ),
              ),
              Align(
                alignment: fifthAnim.value,
                child: getItem(options.elementAt(4)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    controller.isCompleted
                        ? controller.reverse()
                        : controller.forward();
                  },
                  child: buildPrimaryItem(
                      controller.isCompleted || controller.isAnimating
                          ? Icons.close
                          : Icons.add),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
