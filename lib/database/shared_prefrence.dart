import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferenceService {
  static const String tasksKey = 'tasks';

  Future<void> saveTasks(List<Map<String, dynamic>> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tasksString = jsonEncode(tasks);
    await prefs.setString(tasksKey, tasksString);
  }

  Future<List<Map<String, dynamic>>> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksString = prefs.getString(tasksKey);
    if (tasksString != null) {
      List<dynamic> decodedTasks = jsonDecode(tasksString);
      return decodedTasks
          .map((task) => Map<String, dynamic>.from(task))
          .toList();
    }
    return [];
  }

  Future<void> clearTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(tasksKey);
  }
}
