import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_details.dart';
import 'package:todo_app/theme/app_color.dart';
import 'package:todo_app/theme/app_theme.dart';

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
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pop(context, true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            task.title,
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(6, 8, 6, 4),
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: task.isDone
                        ? AppColors.completedTask
                        : AppColors.pendingTask,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(task.title,
                          style: AppTheme.lightTheme.textTheme.bodyMedium),
                      Icon(
                        CupertinoIcons.trash,
                        color: AppColors.black,
                        size: 24,
                      ),
                      Checkbox(
                        value: task.isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            task.isDone = value!;
                          });
                        },
                        activeColor: AppColors.accent,
                        checkColor: AppColors.background,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
