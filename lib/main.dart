import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/task_detail.dart';
import 'package:todo_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/taskDetail') {
          final int taskId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => TaskDetail(taskId: taskId),
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: AppTheme.lightTheme,
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}
