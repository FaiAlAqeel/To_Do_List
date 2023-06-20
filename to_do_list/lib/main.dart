import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/login_screen.dart';
import 'package:to_do_list/models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GetBuilder<TaskData>(
        init: TaskData(),
        builder: (taskData) => const MaterialApp(
          home:LoginScreen(),
        ),
      ),
    );
  }
}