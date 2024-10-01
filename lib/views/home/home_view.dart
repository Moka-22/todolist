import 'package:flutter/material.dart';
import 'package:todolist/database/shared_prefrence.dart';
import 'package:todolist/views/tasks/edit_task_view.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> _tasks = [];
  final SharedPreferenceService _preferenceService = SharedPreferenceService();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  // Load tasks from shared preferences
  Future<void> _loadTasks() async {
    List<Map<String, dynamic>> loadedTasks = await _preferenceService.loadTasks();
    setState(() {
      _tasks = loadedTasks;
    });
  }

  // Save tasks to shared preferences
  Future<void> _saveTasks() async {
    await _preferenceService.saveTasks(_tasks);
  }

  // Add a new task
  void _addTask() {
    Navigator.pushNamed(context, '/add').then((value) {
      if (value != null && value is Map<String, dynamic>) {
        setState(() {
          _tasks.add(value);
        });
        _saveTasks();
      }
    });
  }

  // Edit an existing task
  void _editTask(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskScreen(task: _tasks[index], index: index),
      ),
    ).then((value) {
      if (value != null && value is Map<String, dynamic>) {
        setState(() {
          _tasks[index] = value;
        });
        _saveTasks();
      }
    });
  }

  // Toggle task completion
  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index]['completed'] = !_tasks[index]['completed'];
    });
    _saveTasks();
  }

  // Delete a task
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('To-Do List App',style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(
              task['title'],
              style: TextStyle(
                decoration: task['completed'] ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
            subtitle: Text(task['description'],style: TextStyle(
              decoration: task['completed'] ? TextDecoration.lineThrough : TextDecoration.none,
            ),),
            leading: Checkbox(
              value: task['completed'],
              onChanged: (bool? value) {
                _toggleTaskCompletion(index);
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editTask(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteTask(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: _addTask,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
