// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

enum Month {
  Enero,
  Febrero,
  Marzo,
  Abril,
  Mayo,
  Junio,
  Julio,
  Agosto,
  Septiembre,
  Octubre,
  Noviembre,
  Diciembre
}

class MonthWheel extends StatelessWidget {
  final int initValue;
  final void Function(int i) onChange;
  const MonthWheel({super.key, required this.onChange, this.initValue = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: WheelChooser.byController(
          controller: FixedExtentScrollController(initialItem: initValue - 1),
          unSelectTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
          selectTextStyle: Theme.of(context).textTheme.bodySmall,
            magnification: 1.2,
            // unSelectTextStyle: TextStyle(color: Colors.grey),
            onValueChanged: (newVal) {
              Month enumMonth = Month.values.firstWhere((e) => e.toString() == 'Month.$newVal');
              int monthIndex = enumMonth.index;
              print(monthIndex);
              onChange(monthIndex);
            },
            datas: [
              for (var month in Month.values)
                month.toString().split('.').last
          ]));
  }
}

