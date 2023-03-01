import 'package:acordame/components/Task.dart';
import 'package:acordame/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  List<TaskModel> allTasks = [];

  final Stream<QuerySnapshot> _tasksStream =
      FirebaseFirestore.instance.collection('tasks').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _tasksStream,
        builder: (context, snapshot) {
          // ERROR
          if (snapshot.hasError) {
            return const Text("Something went wrong fetching the data");
          }

          // IS LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          // BUILD TASKLIST
          return ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  // Map<String, dynamic> data =
                  //     document.data()! as Map<String, dynamic>;
                  final TaskModel task = TaskModel.fromFirestore(
                      document as DocumentSnapshot<Map<String, dynamic>>);
                  return Task(id: document.id, data: task);
                })
                .toList()
                .cast(),
          );
        });
  }
}
