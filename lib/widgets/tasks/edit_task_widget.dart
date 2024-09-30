import 'package:flutter/material.dart';
import 'package:todolist/widgets/appbar/custom_appbar.dart';
import 'package:todolist/widgets/button/custom_button.dart';
import 'package:todolist/widgets/textformfield/task_text_form_field.dart';

class EditTaskWidget extends StatefulWidget {
  final String initialTaskName;
  final String initialTaskDescription;
  final Function(String name, String description) onSave;

  const EditTaskWidget({
    super.key,
    required this.initialTaskName,
    required this.initialTaskDescription,
    required this.onSave,
  });

  @override
  State<EditTaskWidget> createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  final _formKey = GlobalKey<FormState>();
  String? taskName;
  String? taskDescription;

  @override
  void initState() {
    super.initState();
    taskName = widget.initialTaskName;
    taskDescription = widget.initialTaskDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Task')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                text: 'Edit Task',
              ),
              const SizedBox(height: 20),
              TaskTextFormField(
                labelText: 'Task Name',
                initialValue: taskName,
                onSaved: (value) {
                  taskName = value;
                },
              ),
              const SizedBox(height: 20),
              TaskTextFormField(
                labelText: 'Description',
                initialValue: taskDescription,
                maxLines: 5,
                onSaved: (value) {
                  taskDescription = value;
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        widget.onSave(taskName!, taskDescription!);
                        Navigator.pop(context); // Return to previous screen
                      }
                    },
                  ),
                  const SizedBox(width: 50),
                  CustomButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context); // Simply go back without changes
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
