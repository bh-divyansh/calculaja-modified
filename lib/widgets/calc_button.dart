import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    Key? key,
    required this.buttonText,
    required this.onButtonPress,
  }) : super(key: key);
  final String buttonText;
  final void Function(String) onButtonPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: () {
            onButtonPress(buttonText);
          },
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }
}
