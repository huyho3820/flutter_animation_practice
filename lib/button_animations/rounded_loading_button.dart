import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomRoundedLoadingButton extends StatefulWidget {
  const CustomRoundedLoadingButton({super.key});

  @override
  State<CustomRoundedLoadingButton> createState() =>
      _CustomRoundedLoadingButtonState();
}

class _CustomRoundedLoadingButtonState
    extends State<CustomRoundedLoadingButton> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void doSomething() async {
    Timer(
      const Duration(seconds: 3),
      () {
        _btnController.success();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RoundedLoadingButton(
            controller: _btnController,
            onPressed: doSomething,
            child: const Text(
              'Tap me!',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
