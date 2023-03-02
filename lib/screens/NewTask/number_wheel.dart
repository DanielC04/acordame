import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class NumberWheel extends StatelessWidget {
  final int minValue;
  final int maxValue;
  final int initValue;
  final bool isInfinite;
  final bool shouldPadZeros;
  final void Function(int i) onChange;

  const NumberWheel({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initValue,
    required this.onChange,
    this.shouldPadZeros = true,
    this.isInfinite = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60,
        child: WheelChooser.byController(
            controller:
                FixedExtentScrollController(initialItem: initValue - minValue),
            unSelectTextStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey),
            selectTextStyle: Theme.of(context).textTheme.bodySmall,
            magnification: 1.2,
            // unSelectTextStyle: TextStyle(color: Colors.grey),
            onValueChanged: (newVal) {
              print(newVal);
              int numberAsInt;
              if (newVal.runtimeType == int) {
                numberAsInt = newVal;
              } else if (newVal[0] == '0') {
                numberAsInt = int.parse(newVal.substring(1, newVal.length));
              } else {
                numberAsInt = int.parse(newVal);
              }
              onChange(numberAsInt);
            },
            isInfinite: isInfinite,
            datas: [
              for (var i = minValue; i <= maxValue; i++)
                if (i < 10 && shouldPadZeros) '0$i' else i
            ]));
  }
}
