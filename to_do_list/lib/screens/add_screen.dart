import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/task_data.dart';

class AddTasksScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTasksScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 155, 72, 170),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Get.find<TaskData>().addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            child: Text("Add"),
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 155, 72, 170),
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}