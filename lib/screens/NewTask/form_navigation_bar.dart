import 'package:flutter/material.dart';

class FormNavigationBar extends StatelessWidget {
  const FormNavigationBar({super.key, required this.submit});
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.cancel)),
      ElevatedButton(
          // submit button was pressed
          // -> create new task
          onPressed: submit,
          child: const Icon(Icons.send))
    ]);
  }
}