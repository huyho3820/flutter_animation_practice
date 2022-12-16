import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationDemo extends StatefulWidget {
  const ImplicitAnimationDemo({super.key});

  @override
  State<ImplicitAnimationDemo> createState() => _ImplicitAnimationDemoState();
}

class _ImplicitAnimationDemoState extends State<ImplicitAnimationDemo> {
  var isAnimationTrigger = false;
  @override
  Widget build(BuildContext context) {
    print('Implicit Animation rebuild');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          curve: Curves.bounceInOut,
          width: isAnimationTrigger ? 250 : 150,
          height: isAnimationTrigger ? 250 : 150,
          decoration: BoxDecoration(
              color: isAnimationTrigger ? Colors.pink : Colors.amber),
          duration: const Duration(seconds: 3),
          child: AnimatedOpacity(
            opacity: isAnimationTrigger ? 1 : 0,
            duration: const Duration(seconds: 3),
            child: Icon(
              Icons.favorite,
              size: isAnimationTrigger ? 120 : 30,
              color: Colors.white,
            ),
          ),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 2 * pi),
          duration: const Duration(seconds: 3),
          onEnd: () {},
          builder: (context, value, child) {
            return Transform.rotate(
              angle: value,
              child: Transform.scale(scale: value, child: child),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/nhanduong.png'),
                    fit: BoxFit.cover)),
            height: 30,
            width: 30,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                isAnimationTrigger = !isAnimationTrigger;
              });
            },
            child: const Text('Trigger Animation'))
      ],
    );
  }
}

// class ImplicitAnimationDemo extends StatefulWidget {
//   const ImplicitAnimationDemo({super.key});

//   @override
//   State<ImplicitAnimationDemo> createState() => _ImplicitAnimationDemoState();
// }

// class _ImplicitAnimationDemoState extends State<ImplicitAnimationDemo> {
//   var isAnimationTrigger = false;
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Built-in Animation'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             AnimatedContainer(
//               curve: Curves.bounceInOut,
//               width: isAnimationTrigger ? 250 : 150,
//               height: isAnimationTrigger ? 250 : 150,
//               decoration: BoxDecoration(
//                   color: isAnimationTrigger ? Colors.pink : Colors.amber),
//               duration: const Duration(seconds: 3),
//               child: AnimatedOpacity(
//                 opacity: isAnimationTrigger ? 1 : 0,
//                 duration: const Duration(seconds: 3),
//                 child: Icon(
//                   Icons.favorite,
//                   size: isAnimationTrigger ? 120 : 30,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             TweenAnimationBuilder<double>(
//               tween: Tween(begin: 0, end: 2 * pi),
//               duration: const Duration(seconds: 3),
//               builder: (context, value, child) {
//                 return Transform.rotate(
//                   angle: value,
//                   child: Transform.scale(scale: value, child: child),
//                 );
//               },
//               child: const Icon(
//                 Icons.arrow_drop_up,
//                 size: 50,
//                 color: Colors.pink,
//               ),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isAnimationTrigger = !isAnimationTrigger;
//                   });
//                 },
//                 child: const Text('Trigger Animation'))
//           ],
//         ),
//       ),
//     );
//   }
// }
