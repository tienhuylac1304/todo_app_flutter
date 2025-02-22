import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/theme/app_color.dart';
import 'package:todo_app/theme/app_theme.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key,
    required this.task,
    required this.onTaskUpdate,
  });

  final Task task;
  final Function(Task) onTaskUpdate;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  late Task _task;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
  }

  void goToTaskDetails(BuildContext context, int taskId) async {
    final result =
        await Navigator.pushNamed(context, '/taskDetail', arguments: taskId);

    if (result == true) {
      widget.onTaskUpdate(_task);
      setState(() {});
    }
  }

  void deleteTask() {
    Task.tasks.removeWhere((task) => task.id == _task.id);
    setState(() {
      widget.onTaskUpdate(_task);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool checkboxVisible = _task.taskDetails.isEmpty || _task.isDone;

    return InkWell(
      onTap: () => goToTaskDetails(context, _task.id),
      child: Container(
        margin: const EdgeInsets.fromLTRB(6, 8, 6, 4),
        padding: EdgeInsets.fromLTRB(checkboxVisible ? 10 : 20, 15, 30, 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _task.isDone ? AppColors.completedTask : AppColors.pendingTask,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Visibility(
                  visible: checkboxVisible,
                  child: Checkbox(
                    value: _task.isDone,
                    onChanged: (value) {
                      setState(() {
                        _task.isDone = value!;
                      });
                      widget.onTaskUpdate(_task);
                    },
                    checkColor: AppColors.black,
                  ),
                ),
                Text(
                  _task.title,
                  style: AppTheme.lightTheme.textTheme.bodyMedium,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.trash,
                color: AppColors.black,
                size: 24,
              ),
              onPressed: () => deleteTask(),
            ),
          ],
        ),
      ),
    );
  }
}
