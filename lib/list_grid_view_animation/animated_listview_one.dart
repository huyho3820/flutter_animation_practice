import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/list_grid_view_animation/animated_listview_four.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAnimatedListviewOne extends StatefulWidget {
  const CustomAnimatedListviewOne({super.key});

  @override
  State<CustomAnimatedListviewOne> createState() =>
      _CustomAnimatedListviewOneState();
}

class _CustomAnimatedListviewOneState extends State<CustomAnimatedListviewOne> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SlideAnimation4(),
                  ));
            },
            child: const Text('View animating listview')),
      ),
    );
  }
}

class SlideAnimating1 extends StatelessWidget {
  const SlideAnimating1({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go back'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
          //[AnimationLimiter] that will prevents the children widgets to be animated
          // if they don't appear in the first frame where AnimationLimiter is built.
          child: ListView.builder(
        padding: EdgeInsets.all(w / 30),
        physics: const BouncingScrollPhysics(
            // Creates scroll physics that bounce back from the edge.
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 20,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
              position:
                  index, //Index used as a factor to calculate the delay of each child's animation.
              delay: const Duration(
                  milliseconds: 100), // delay time to start slide animation
              child: SlideAnimation(
                  duration: const Duration(
                      milliseconds:
                          2500), //The duration of the child animation.
                  curve: Curves.fastLinearToSlowEaseIn,
                  //Creates a slide animation that slides its child from the given
                  //[verticalOffset] and [horizontalOffset] to its final position.
                  horizontalOffset: 30,
                  verticalOffset: 300,
                  child: FlipAnimation(
                      duration: const Duration(milliseconds: 3000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      flipAxis: FlipAxis.y, //The y axis (horizontal flip)
                      child: Container(
                        height: w / 4,
                        margin: EdgeInsets.only(bottom: w / 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 40,
                                  spreadRadius: 10)
                            ]),
                      ))));
        },
      )),
    );
  }
}
