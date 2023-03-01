import 'package:acordame/screens/TaskView/task_view_screen.dart';
import 'package:flutter/material.dart';



class App extends StatelessWidget {
  final String title;
  const App({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: TaskViewScreen()),
      // floatingActionButton: FloatingActionButton(
      //   isExtended: true,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   onPressed: () {
      //     letDialogPopup(context, false, Null);
      //   },
      //   tooltip: 'Tarea nueva',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
