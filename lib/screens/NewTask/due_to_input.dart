import 'package:acordame/screens/NewTask/date_input.dart';
import 'package:acordame/screens/NewTask/duration_input.dart';
import 'package:acordame/screens/NewTask/time_input.dart';
import 'package:flutter/material.dart';

class DueToInput extends StatefulWidget {
  const DueToInput({Key? key}) : super(key: key);

  @override
  _DueToInputState createState() => _DueToInputState();
}

class _DueToInputState extends State<DueToInput>
    with SingleTickerProviderStateMixin {
  Duration? timerDuration;
  String? time;
  String? date;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      registerTabChange(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  registerTabChange(int newTabId) {
  //   Task taskData = Provider.of<Task>(context, listen: false);
  //   if (newTabId == 0) taskData.isUsingTimer = true;
  //   taskData.isUsingTimer = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            tabs: const [
              Tab(text: 'Timer', icon: Icon(Icons.timer)),
              Tab(text: 'Uhrzeit', icon: Icon(Icons.timelapse)),
              Tab(text: 'Datum', icon: Icon(Icons.date_range)),
            ],
          ),
          Container(
              height: 400, //height of TabBarView
              child: TabBarView(controller: _tabController, children: <Widget>[
                const Center(
                  child: DurationInput(),
                ),
                Center(child: TimeInput()),
                Center(child: DateInput()),
              ]))
        ]);
  }
}
