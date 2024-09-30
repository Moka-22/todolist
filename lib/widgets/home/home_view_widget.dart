// import 'package:flutter/material.dart';
// import 'package:todolist/database/shared_prefrence.dart';
// import 'package:todolist/models/task_model.dart';
// import 'package:todolist/widgets/appbar/custom_appbar.dart';
//
// class HomeViewWidget extends StatefulWidget {
//   const HomeViewWidget({
//     super.key,
//   });
//
//   @override
//   State<HomeViewWidget> createState() => _HomeViewWidgetState();
// }
//
// class _HomeViewWidgetState extends State<HomeViewWidget> {
//   List<Task> _tasks = [];
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Column(
//         children: [
//           // Custom Appbar
//           CustomAppBar(text: 'ToDO List App',icon: Icons.search_outlined,),
//           const SizedBox(height: 50,),
//           // to do list item
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: ListTile(
//               title: Text(
//                   _tasks[index].name,
//                   style: TextStyle(
//                     decoration: _tasks[index].isCompleted
//                         ? TextDecoration.lineThrough
//                         : TextDecoration.none,
//                   ),
//               ),
//               subtitle: Text(_tasks[index].description),
//               leading:Checkbox(
//                 value: _tasks[index].isCompleted,
//                 onChanged: (value) => _toggleTaskCompletion(index),
//               ),
//               trailing: IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () => _editTask(index),
//               ),
//             ),
//           ),
//         ],
//       ),
//
//     );
//   }
//   void _toggleTaskCompletion(int index) {
//     setState(() {
//       _tasks[index].isCompleted = !_tasks[index].isCompleted;
//     });
//     _saveTasks();
//   }
//   void _editTask(int index) {
//     // Navigate to Edit Task Screen (create and implement EditTaskScreen widget)
//   }
//   Future<void> _saveTasks() async {
//     await TaskPreferences.saveTasks(_tasks);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _loadTasks();
//   }
//
//   Future<void> _loadTasks() async {
//     List<Task> tasks = await TaskPreferences.loadTasks();
//     setState(() {
//       _tasks = tasks;
//     });
//   }
//
//
// }