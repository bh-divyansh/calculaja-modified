import 'package:flutter/material.dart';
import 'calc_button.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key? key,
    required this.onButtonPress,
    required this.buttonsText,
  }) : super(key: key);
  final void Function(String) onButtonPress;

  final List<String> buttonsText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CalcButton(
            buttonText: buttonsText[0],
            onButtonPress: onButtonPress,
          ),
          CalcButton(
            buttonText: buttonsText[1],
            onButtonPress: onButtonPress,
          ),
          CalcButton(
            buttonText: buttonsText[2],
            onButtonPress: onButtonPress,
          ),
          CalcButton(
            buttonText: buttonsText[3],
            onButtonPress: onButtonPress,
          ),
        ],
      ),
    );
  }
}
