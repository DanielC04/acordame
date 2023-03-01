import 'package:acordame/models/task_model.dart';
import 'package:acordame/screens/NewTask/new_task_screen.dart';
import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String id;
  final TaskModel data;

  const Task({super.key, required this.id, required this.data});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: ExpansionTile(
        title: Text(data.name),
        children: [Text(data.description)],
      ),
      background: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [Icon(Icons.delete_sweep_outlined)],
          )),
      secondaryBackground: Container(
          color: Colors.blue,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [Icon(Icons.edit)])),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NewTaskScreen(
                    title: 'Editar tarea',
                    taskData: data,
                  )));
          return false;
        }

        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content: const Text("Are you sure you wish to delete this item?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("DELETE"),
                    style: TextButton.styleFrom(foregroundColor: Colors.red)),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCEL"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
