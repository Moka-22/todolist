import 'package:flutter/material.dart';
import 'package:todolist/database/shared_prefrence.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/views/tasks/add_task_view.dart';
import 'package:todolist/views/tasks/edit_task_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    List<Task> tasks = await TaskPreferences.loadTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  Future<void> _saveTasks() async {
    await TaskPreferences.saveTasks(_tasks);
  }

  void _addTask() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AddTaskView()),);
  }

  void _editTask(int index) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> EditTaskView()),);
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
    _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_tasks[index].name), // Unique key for each task
            direction: DismissDirection.endToStart, // Swipe from right to left
            onDismissed: (direction) {
              _deleteTask(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Task deleted")),
              );
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              title: Text(
                _tasks[index].name,
                style: TextStyle(
                  decoration: _tasks[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              subtitle: Text(_tasks[index].description),
              trailing: Checkbox(
                value: _tasks[index].isCompleted,
                onChanged: (value) => _toggleTaskCompletion(index),
              ),
              onTap: () => _editTask(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTask,
      ),
    );
  }
}
