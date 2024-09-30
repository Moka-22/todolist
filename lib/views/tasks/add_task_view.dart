import 'package:flutter/material.dart';
import 'package:todolist/widgets/tasks/add_task_widget.dart';

class AddTaskView extends StatefulWidget {
  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddTaskWidget(onSave: (String name, description) {  },),
      ),
    );
  }
}