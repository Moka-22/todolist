import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

class TaskPreferences {
  static const String taskKey = 'tasks';

  // Save task list
  static Future<void> saveTasks(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskList = tasks.map((task) => jsonEncode(task.toJson())).toList();
    prefs.setStringList(taskKey, taskList);
  }

  // Load task list
  static Future<List<Task>> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList(taskKey);
    if (taskList != null) {
      return taskList.map((taskString) => Task.fromJson(jsonDecode(taskString))).toList();
    }
    return [];
  }
}
