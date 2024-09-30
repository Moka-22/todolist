import 'package:flutter/material.dart';
import 'package:todolist/widgets/appbar/custom_appbar.dart';
import 'package:todolist/widgets/button/custom_button.dart';
import 'package:todolist/widgets/textformfield/task_text_form_field.dart';

class AddTaskWidget extends StatefulWidget {
  final Function(String name, String description) onSave;

  const AddTaskWidget({
    super.key,
    required this.onSave, // Required to pass a callback function to save the new task
  });

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _formKey = GlobalKey<FormState>();
  String? taskName;
  String? taskDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                text: 'Add Task',
              ),
              const SizedBox(height: 20),
              TaskTextFormField(
                labelText: 'Task Name',
                onSaved: (value) {
                  taskName = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TaskTextFormField(
                labelText: 'Description',
                maxLines: 5,
                onSaved: (value) {
                  taskDescription = value!;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        widget.onSave(taskName!, taskDescription!); // Pass new task data to the callback
                        Navigator.pop(context); // Return to the previous screen after saving
                      }
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  CustomButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context); // Simply go back without adding any task
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
