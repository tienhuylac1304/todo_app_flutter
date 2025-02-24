import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_details.dart';
import 'package:todo_app/theme/app_color.dart';
import 'package:todo_app/theme/app_theme.dart';
import 'package:todo_app/widgets/detail_list_item.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key, required this.taskId});
  final int taskId;

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Task task = Task.tasks.firstWhere((task) => task.id == widget.taskId);

    List<TaskDetails> taskDetails = TaskDetails.taskDetails
        .where((d) => d.taskId == widget.taskId)
        .toList();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(context, true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.create_solid,size: 30,
              ),
            ),
          ],
          title: Text(
            task.title,
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List<DetailListItem>.generate(
                        taskDetails.length,
                        (index) => DetailListItem(
                            detail: taskDetails[index],
                            onTaskUpdate: (updatedTask) {
                              setState(() {});
                            })),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "New detail",
                    style: AppTheme.lightTheme.textTheme.headlineMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent),
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
