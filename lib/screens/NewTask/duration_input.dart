import 'package:acordame/models/task_model.dart';
import 'package:acordame/screens/NewTask/number_wheel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DurationInput extends StatelessWidget {
  const DurationInput({Key? key}) : super(key: key);

  TaskModel getTask(context) => Provider.of<TaskModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    TaskModel data = getTask(context);
    DateTime now = DateTime.now();
    Duration timeDifference = now.difference(data.dueTo);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberWheel(
          minValue: 0,
          maxValue: 23,
          initValue: 0,
          onChange: (i) => getTask(context).dueTo = now.add(Duration(hours: i))
        ),
        const VerticalDivider(),
        NumberWheel(
          minValue: 0,
          maxValue: 59,
          initValue: 0,
          onChange: (i) {},
          // onChange: ((i) => getTask(context). = i)),
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
