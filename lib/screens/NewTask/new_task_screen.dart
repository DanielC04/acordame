import 'package:acordame/models/task_model.dart';
import 'package:acordame/screens/NewTask/form_navigation_bar.dart';
import 'package:acordame/screens/NewTask/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTaskScreen extends StatefulWidget {
  final String title;
  final TaskModel taskData;
  const NewTaskScreen({super.key, required this.title, required this.taskData});

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  submit() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No guardó los datos')),
      );
    }
    widget.taskData.saveChangesToFirestore();
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos guardados :)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SizedBox.expand(
            child: Container(
                // color: Theme.of(context).primaryColorLight,
                padding: const EdgeInsets.all(10),
                child: ChangeNotifierProvider(
                    create: (context) => widget.taskData,
                    child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _formKey,
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: const <Widget>[
                                  InputFields(),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: FormNavigationBar(submit: submit),
                            ),
                          ],
                        ))))));
  }
}
