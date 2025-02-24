import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/theme/app_color.dart';
import 'package:todo_app/theme/app_theme.dart';
import 'package:todo_app/widgets/task_list_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = Task.tasks;
  TextEditingController taskNameController = TextEditingController();
  //function
  void addTask(String taskName) {
    setState(() {
      Task task = Task(id: tasks.length + 1, title: taskName, taskDetails: []);
      tasks.add(task);
    });
  }

  bool textFieldIsValid(String text) {
    return taskNameController.text.isNotEmpty &&
        (taskNameController.text.replaceAll(RegExp(r"\s+"), "")) != "";
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoList'),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.calendar,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<ListItem>.generate(
              tasks.length,
              (index) => ListItem(
                task: tasks[index],
                onTaskUpdate: (updatedTask) {
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bottomSheetContext) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      children: [
                        TextField(
                          controller: taskNameController,
                          style: AppTheme.lightTheme.textTheme.bodyMedium,
                          cursorColor: AppColors.black,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: AppColors.black,
                              width: 1,
                            )),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Your task name",
                            labelStyle:
                                AppTheme.lightTheme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (textFieldIsValid(taskNameController.text)) {
                                addTask(taskNameController.text);
                              }
                              taskNameController.clear();
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Add task",
                              style: AppTheme.lightTheme.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        tooltip: 'New task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
