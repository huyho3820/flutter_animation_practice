import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAnimatedGridView extends StatelessWidget {
  const CustomAnimatedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GridView2(),
                  ));
            },
            child: const Text('View Animating GridView')),
      ),
    );
  }
}

class GridView1 extends StatelessWidget {
  const GridView1({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Back'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
              50,
              (index) => AnimationConfiguration.staggeredGrid(
                  duration: const Duration(milliseconds: 500),
                  position: index,
                  columnCount: columnCount,
                  child: ScaleAnimation(
                      duration: const Duration(seconds: 40),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                          child: Container(
                        margin: EdgeInsets.only(
                            bottom: w / 30, left: w / 60, right: w / 60),
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
                      ))))),
        ),
      ),
    );
  }
}

class GridView2 extends StatelessWidget {
  const GridView2({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Back'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
              30,
              (index) => AnimationConfiguration.staggeredGrid(
                  duration: const Duration(milliseconds: 500),
                  position: index,
                  columnCount: columnCount,
                  child: ScaleAnimation(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.fastLinearToSlowEaseIn,
                      scale: 1.5,
                      //Scaling factor to apply at the start of the animation.
                      child: FadeInAnimation(
                          child: Container(
                        margin: EdgeInsets.only(
                            bottom: w / 30, left: w / 60, right: w / 60),
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
                      ))))),
        ),
      ),
    );
  }
}
