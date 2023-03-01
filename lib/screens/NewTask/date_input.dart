import 'package:acordame/screens/NewTask/month_wheel.dart';
import 'package:acordame/screens/NewTask/number_wheel.dart';
import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  int month = DateTime.now().month - 1;
  late int daysInCurrentMonth;

  DateInput({Key? key}) : super(key: key);

  int numberOfDaysInCurrentMonth() {
    // to-do: check if selected month and year is current month & year -> day before today can't be selected
    return DateTime(2023, month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberWheel(
          minValue: 1,
          maxValue: 30,
          initValue: 1,
          shouldPadZeros: false,
          onChange: (i) {},
          // initValue: getTask(context).dateDay,
          // onChange: (i) => getTask(context).dateDay = i,
        ),
        const MonthWheel(initValue: 0),
        NumberWheel(
          minValue: DateTime.now().year,
          maxValue: 2100,
          initValue: 2023,
          // initValue: getTask(context).dateYear,
          onChange: (i) {},
          isInfinite: false,
          // onChange: (i) => getTask(context).dateYear = i,
        ),
      ],
    );
  }
}
