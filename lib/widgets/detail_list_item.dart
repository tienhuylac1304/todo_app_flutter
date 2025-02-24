import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_details.dart';
import 'package:todo_app/theme/app_color.dart';
import 'package:todo_app/theme/app_theme.dart';

class DetailListItem extends StatefulWidget {
  const DetailListItem({
    super.key,
    required this.detail,
    required this.onTaskUpdate,
  });

  final TaskDetails detail;
  final Function(TaskDetails) onTaskUpdate;

  @override
  State<DetailListItem> createState() => _ListItemState();
}

class _ListItemState extends State<DetailListItem> {
  late TaskDetails _detail;

  @override
  void initState() {
    super.initState();
    _detail = widget.detail;
  }

  void deleteTask() {
    TaskDetails.taskDetails.removeWhere((d) => d.id == _detail.id);
    setState(() {
      widget.onTaskUpdate(_detail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(6, 8, 6, 4),
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _detail.isDone ? AppColors.completedTask : AppColors.pendingTask,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: _detail.isDone,
                onChanged: (value) {
                  setState(() {
                    _detail.isDone = value!;
                  });
                  widget.onTaskUpdate(_detail);
                },
                checkColor: AppColors.black,
              ),
              Text(
                _detail.description,
                style: AppTheme.lightTheme.textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.create,
                  color: AppColors.black,
                  size: 24,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.delete,
                  color: AppColors.black,
                  size: 24,
                ),
                onPressed: () => deleteTask(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
