import 'package:acordame/screens/NewTask/number_wheel.dart';
import 'package:flutter/material.dart';

class TimeInput extends StatelessWidget {
  const TimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberWheel(
          minValue: 0,
          maxValue: 23,
          initValue: 0,
          onChange: (_) {},
          // initValue: getTask(context).timeHours,
          // onChange: (i) => getTask(context).timeHours = i,
        ),
        const Text(':'),
        NumberWheel(
          minValue: 0,
          maxValue: 59,
          initValue: 0,
          onChange: (i) {},
          // initValue: getTask(context).timeMinutes,
          // onChange: (i) => getTask(context).timeMinutes = i,
        ),
      ],
    );
  }
}
