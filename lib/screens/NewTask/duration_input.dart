import 'package:acordame/screens/NewTask/number_wheel.dart';
import 'package:flutter/material.dart';

class DurationInput extends StatelessWidget {
  const DurationInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberWheel(
            minValue: 0,
            maxValue: 23,
            initValue: 0,
            onChange: (i) {},
            // initValue: min(getTask(context).timerOffsetHours, 23),
            // onChange: (i) => getTask(context).timerOffsetHours = i),
        ),
        const VerticalDivider(),
        NumberWheel(
            minValue: 0,
            maxValue: 59,
            initValue: 0,
            onChange: (i) {},
            // initValue: min(getTask(context).timerOffsetMinutes, 59),
            // onChange: ((i) => getTask(context).timerOffsetMinutes = i)),
        ),
        const VerticalDivider(),
        NumberWheel(
            minValue: 0,
            maxValue: 59,
            initValue: 0,
            onChange: (i) {},
            // initValue: min(getTask(context).timerOffsetHours, 59),
            // onChange: (i) => getTask(context).timerOffsetSeconds = i)
        ),
      ],
    );
  }
}
