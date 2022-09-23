import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, this.color, this.onPressed, this.buttonName})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final color;
  // ignore: prefer_typing_uninitialized_variables
  final onPressed;
  // ignore: prefer_typing_uninitialized_variables
  final buttonName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(buttonName,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }
}
