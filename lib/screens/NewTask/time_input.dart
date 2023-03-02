import 'package:acordame/models/task_model.dart';
import 'package:acordame/screens/NewTask/number_wheel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeInput extends StatelessWidget {
  const TimeInput({super.key});

  TaskModel getTask(context) => Provider.of<TaskModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberWheel(
          minValue: 0,
          maxValue: 23,
          initValue: getTask(context).dueTo.hour,
          onChange: (i) => getTask(context).hour = i
        ),
        const Text(':'),
        NumberWheel(
          minValue: 0,
          maxValue: 59,
          initValue: getTask(context).dueTo.minute,
          onChange: (i) => getTask(context).minutes = i
        ),
      ],
    );
  }
}
