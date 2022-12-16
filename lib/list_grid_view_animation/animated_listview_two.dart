import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SlideAnimation2 extends StatelessWidget {
  const SlideAnimation2({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go back'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
          child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(w / 30),
        itemCount: 20,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 2500),
                  horizontalOffset: -300,
                  verticalOffset: -850,
                  child: Container(
                    margin: EdgeInsets.only(bottom: w / 20),
                    height: w / 4,
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
                  )));
        },
      )),
    );
  }
}
