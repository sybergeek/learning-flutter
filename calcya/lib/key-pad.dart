import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CalculatorKey(symbol: Keys.clear),
          ],
        )
      ],
    );
  }
}
