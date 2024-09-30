import 'package:flutter/material.dart';
import 'package:todolist/widgets/tasks/edit_task_widget.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key});

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EditTaskWidget(initialTaskName: '', initialTaskDescription: '', onSave: (String name, String description) {  },),
      ),
    );
  }
}
