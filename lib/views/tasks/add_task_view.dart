import 'package:flutter/material.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _saveTask() {
    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
      Navigator.pop(context, {
        'title': _titleController.text,
        'description': _descriptionController.text,
        'completed': false,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Add Task',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Task Title',border: OutlineInputBorder(),),
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Task Description',border: OutlineInputBorder(),),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _saveTask,
                  child: const Text('Save'),
                ),

                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
