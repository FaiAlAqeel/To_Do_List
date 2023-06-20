import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:to_do_list/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  final bool showCompletedTasks; // Added to determine whether to show completed tasks or not

  TasksList({this.showCompletedTasks = true});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskData>(
      builder: (taskData) {
        final tasks = showCompletedTasks
            ? taskData.tasks.where((task) => task.isDone).toList()
            : taskData.tasks.where((task) => !task.isDone).toList();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TasksTile(
              isChecked: tasks[index].isDone,
              taskTitle: tasks[index].name,
              checkboxChange: (newValue) {
                taskData.updateTask(tasks[index]);
              },
              listTileDelete: () {
                taskData.deleteTask(tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}