import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/widgets/tasks_list.dart';
import '../models/task_data.dart';
import 'add_screen.dart';
import 'login_screen.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTasksScreen((newTaskTitle) {
                    Get.find<TaskData>().addTask(newTaskTitle);
                  }),
                ),
              ),
            );
          },
          backgroundColor: Colors.grey,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Color.fromARGB(255, 155, 72, 170),
        body: Container(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 60, bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.playlist_add_check,
                        size: 40, color: Colors.white),
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                  ),
                  const SizedBox(width: 90),
                  const Text("To Do List",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Obx(() => Text(
                    '${Get.find<TaskData>().tasks.length} Tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
              const SizedBox(height: 20),
              const TabBar(
                // Added TabBar
                tabs: [
                  Tab(text: 'Tab Done'),
                  Tab(text: 'Tab not Done'),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBarView(
                    children: [
                      TasksList(
                        showCompletedTasks: true,
                      ), // Content for completed tasks
                      TasksList(
                          showCompletedTasks:
                              false), // Content for not completed tasks
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
