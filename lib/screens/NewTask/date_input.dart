import 'package:acordame/models/task_model.dart';
import 'package:acordame/screens/NewTask/month_wheel.dart';
import 'package:acordame/screens/NewTask/number_wheel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateInput extends StatelessWidget {
  int month = DateTime.now().month - 1;
  late int daysInCurrentMonth;

  DateInput({Key? key}) : super(key: key);

  TaskModel getTask(context) => Provider.of<TaskModel>(context, listen: false);

  int numberOfDaysInCurrentMonth() {
    // to-do: check if selected month and year is current month & year -> day before today can't be selected
    return DateTime(2023, month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    TaskModel task = getTask(context);
    print("the loaded month: ${task.dueTo.month}");

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberWheel(
          minValue: 1,
          maxValue: 30,
          initValue: task.dueTo.day,
          shouldPadZeros: false,
          onChange: (i) {
            task.day = i;
          },
        ),
        MonthWheel(
            initValue: task.dueTo.month,
            onChange: (i) {
              task.month = i;
            }),
        NumberWheel(
          minValue: DateTime.now().year,
          maxValue: 2100,
          initValue: task.dueTo.year,
          isInfinite: false,
          onChange: (i) => task.year = i,
        ),
      ],
    );
  }
}
