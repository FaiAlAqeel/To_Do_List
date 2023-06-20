import 'package:get/get.dart';


class TaskData extends GetxController {
  RxList<Task> tasks = <Task>[].obs;

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    update();
  }

  void updateTask(Task task) {
    task.done();
      update();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
      update();
  }
} class Task {
  final String name;
  bool isDone;
  Task({required this.name, this.isDone = false});
  void done() {
    isDone = !isDone;
  }
}