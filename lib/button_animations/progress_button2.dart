import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class CustomProgressButton2 extends StatefulWidget {
  const CustomProgressButton2({super.key});

  @override
  State<CustomProgressButton2> createState() => _CustomProgressButton2State();
}

class _CustomProgressButton2State extends State<CustomProgressButton2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProgressButton(
          defaultWidget: const Text('Tap here'),
          progressWidget: const CircularProgressIndicator(),
          width: 200,
          height: 40,
          borderRadius: 50,
          onPressed: () async {
            int score = await Future.delayed(
              const Duration(milliseconds: 3000),
              () => 42,
            );
            return () {};
          },
        ),
      ),
    );
  }
}
