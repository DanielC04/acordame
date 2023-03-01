import 'package:acordame/models/task_model.dart';
import 'package:acordame/screens/NewTask/due_to_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TaskModel taskData = getTask();
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      //
      // input of title
      //
      TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.title),
              hintText: 'Ingresá el titulo de la tarea',
              labelText: 'Título'),
          initialValue: taskData.name,
          validator: (title) => (title == null || title.isEmpty)
              ? 'Ingresar título valido'
              : null,
          onSaved: (newTitle) => updateTitle(newTitle ?? '')),
      //
      // input of description
      //
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.description),
          hintText: 'Ingresá la descricción de la tarea (opciónal)',
          labelText: 'Descripción',
        ),
        // initialValue: task.description,
        initialValue: '',
        onSaved: (newDescription) => updateDescription(newDescription ?? ''),
      ),
      //
      // input of dueTo-Date
      //
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: const DueToInput(),
      )
    ]);
  }

  TaskModel getTask() => Provider.of<TaskModel>(context, listen: false);

  void updateTitle(String newTitle) => null;
  // void updateTitle(String newTitle) => getTask().title = newTitle;

  void updateDescription(String newDescription) => null;
  // getTask().description = newDescription;
}
