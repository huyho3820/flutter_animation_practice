import 'package:flutter/material.dart';

class AnimatedIconTransition extends StatefulWidget {
  const AnimatedIconTransition({super.key});

  @override
  State<AnimatedIconTransition> createState() => _AnimatedIconTransitionState();
}

class _AnimatedIconTransitionState extends State<AnimatedIconTransition>
    with TickerProviderStateMixin {
  bool expanded = true;
  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        reverseDuration: const Duration(milliseconds: 400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      expanded ? controller!.forward() : controller!.reverse();
                      expanded = !expanded;
                    });
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.view_list, progress: controller!)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      expanded ? controller!.forward() : controller!.reverse();
                      expanded = !expanded;
                    });
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.pause_play, progress: controller!)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      expanded ? controller!.forward() : controller!.reverse();
                      expanded = !expanded;
                    });
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close, progress: controller!)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      expanded ? controller!.forward() : controller!.reverse();
                      expanded = !expanded;
                    });
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.add_event, progress: controller!)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      expanded ? controller!.forward() : controller!.reverse();
                      expanded = !expanded;
                    });
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow, progress: controller!)),
            ],
          )
        ],
      ),
    );
  }
}
