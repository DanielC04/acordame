import 'package:acordame/models/task_model.dart';
import 'package:acordame/screens/NewTask/new_task_screen.dart';
import 'package:acordame/screens/TaskView/task_view.dart';
import 'package:flutter/material.dart';

class TaskViewScreen extends StatelessWidget {
  const TaskViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const TaskView(),
      Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewTaskScreen(
                          title: 'Crear tarea nueva',
                          taskData: TaskModel(
                              id: '',
                              description: '', dueTo: DateTime.now(), name: ''),
                        )));
              },
              child: const Text("Tarea nueva")))
    ]);
  }
}
