import 'package:calcuaja/widgets/buttons_row.dart';
import 'package:calcuaja/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
// https://pub.dev/packages/function_tree/install

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({Key? key}) : super(key: key);

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String clickedTexts = '0';

  void onButtonPress(String buttonText) {
    switch (buttonText) {
      case 'C':
        {
          _clearClickedTexts();
        }
        break;
      case '=':
        {
          _calculate();
        }
        break;
      case '«':
        {
          _deleteClickedTexts();
        }
        break;

      default:
        {
          _addClickedText(buttonText);
        }
    }
  }

  void _addClickedText(String textToAdd) {
    // TODO Yourself correct adding for example if I press all caluclation
    // keys 6-÷+ it shows all but in real life this is not possible.
    // So if we have already a caluclation keys then it should be
    // replaced by new one. Exapmle we have 6- if we press ÷ then
    // it will become 6÷ not 6-÷.
    // Add this thing by yourself.
    setState(
      () {
        clickedTexts += textToAdd;
      },
    );
  }

  void _clearClickedTexts() {
    setState(
      () {
        clickedTexts = '';
      },
    );
  }

  void _deleteClickedTexts() {
    setState(
      () {
        clickedTexts = clickedTexts.substring(0, clickedTexts.length - 1);
      },
    );
  }

  void _calculate() {
    setState(
      () {
        print(clickedTexts);
        clickedTexts.replaceAll('*', 'x');
        print(clickedTexts);
        if (clickedTexts.contains('%') == false) {
          final ans = clickedTexts.interpret();

          if (ans.runtimeType == double) {
            clickedTexts = ans.round().toString();
          } else {
            clickedTexts = ans.toString();
          }
        } else {
          // Ye part nhi ho rha
          print('it has %');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  clickedTexts,
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ButtonRow(
                    onButtonPress: onButtonPress,
                    buttonsText: ['C', '%', '«', '/'],
                  ),
                  ButtonRow(
                    onButtonPress: onButtonPress,
                    buttonsText: ['7', '8', '9', 'x'],
                  ),
                  ButtonRow(
                    onButtonPress: onButtonPress,
                    buttonsText: ['4', '5', '6', '-'],
                  ),
                  ButtonRow(
                    onButtonPress: onButtonPress,
                    buttonsText: ['1', '2', '3', '+'],
                  ),
                  ButtonRow(
                    onButtonPress: onButtonPress,
                    buttonsText: ['0', '00', '.', '='],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
