import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SlideAnimation4 extends StatelessWidget {
  const SlideAnimation4({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go back'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
          child: ListView.builder(
        padding: EdgeInsets.all(w / 30),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 20,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
              delay: const Duration(milliseconds: 100),
              position: index,
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                verticalOffset: -250,
                child: ScaleAnimation(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
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
                    )),
              ));
        },
      )),
    );
  }
}
