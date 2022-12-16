// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:slidable_button/slidable_button.dart';

// class CustomDraggableButton extends StatefulWidget {
//   const CustomDraggableButton({super.key});

//   @override
//   State<CustomDraggableButton> createState() => _CustomDraggableButtonState();
// }

// class _CustomDraggableButtonState extends State<CustomDraggableButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: HorizontalSlidableButton(
//             width: MediaQuery.of(context).size.width / 2,
//             buttonWidth: 60.0,
//             color: Colors.blue.withOpacity(0.5),
//             buttonColor: Colors.amber,
//             dismissible: false,
//             label: const Center(
//               child: Text('Slide to unlock'),
//             ),
//             onChanged: (position) {
//               if (position == SlidableButtonPosition.end) {
//                 log('Button is on the right');
//               } else {
//                 log("Button is on the left");
//               }
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text('Left'),
//                   Text('Right'),
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }
