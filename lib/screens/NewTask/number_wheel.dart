import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class NumberWheel extends StatelessWidget {
  final int minValue;
  final int maxValue;
  final int initValue;
  final bool isInfinite;
  final bool shouldPadZeros;
  final void Function(int i)? onChange;

  const NumberWheel({
    Key? super.key,
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
            },
            isInfinite: isInfinite,
            datas: [for (var i = minValue; i <= maxValue; i++) 
              if (i < 10 && shouldPadZeros) '0$i'
              else i
            ]));

    // @override
    // Widget build(BuildContext context) {
    //   WheelChooser.byController
    //   return SizedBox(
    //       width: 90,
    //       child: WheelChooser.integer(
    //         onValueChanged: (s) {
    //           if (onChange != null) onChange!(s);
    //         },
    //         maxValue: maxValue,
    //         minValue: minValue,
    //         initValue: initValue,
    //         isInfinite: isInfinite,
    //         unSelectTextStyle: TextStyle(color: Colors.grey),
    //         squeeze: 1.25,
    //       ));
    // }
  }
}
