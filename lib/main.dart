import 'package:flutter/material.dart';
import 'package:todolist/views/home/home_view.dart';
import 'package:todolist/views/tasks/add_task_view.dart';
import 'package:todolist/views/tasks/edit_task_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      routes: {
        '/add': (context) => const AddTaskScreen(),
        '/edit': (context) => EditTaskScreen(task: {}, index: -1), // Dummy task and index
      },
    );
  }
}

