import 'package:todo_app/models/task_details.dart';

class Task {
  int id;
  String title;
  final DateTime createdAt;
  List<TaskDetails> taskDetails;
  bool isDone;
  DateTime? doneAt;

  Task({required this.id, required this.title, List<TaskDetails>? taskDetails})
      : createdAt = DateTime.now(),
        taskDetails = taskDetails ?? [],
        isDone = false,
        doneAt = null {
    _updateIsDone();
  }

  void addTaskDetail(TaskDetails detail) {
    taskDetails.add(detail);
    _updateIsDone();
  }

  void _updateIsDone() {
    if (taskDetails.isEmpty) {
      isDone = false;
      doneAt = null;
      return;
    }

    isDone = taskDetails.every((detail) => detail.isDone);
    doneAt = isDone ? DateTime.now() : null;
  }

  void markDetailAsDone(int detailId) {
    final detail = taskDetails.firstWhere(
      (d) => d.id == detailId,
      orElse: () => throw Exception('Detail not found'),
    );
    detail.isDone = true;
    _updateIsDone();
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, createdAt: $createdAt, isDone: $isDone, doneAt: $doneAt}';
  }

//fake data

  static List<Task> tasks = [
    Task(
        id: 1,
        title: 'Tập thể dục buổi sáng',
        taskDetails:
            TaskDetails.taskDetails.where((d) => d.taskId == 1).toList()),
    Task(
        id: 2,
        title: 'Ăn cơm trưa',
        taskDetails:
            TaskDetails.taskDetails.where((d) => d.taskId == 2).toList()),
    Task(
        id: 3,
        title: 'Đi tắm',
        taskDetails:
            TaskDetails.taskDetails.where((d) => d.taskId == 3).toList()),
    Task(
        id: 4,
        title: 'Đã xong một ngày',
        taskDetails:
            TaskDetails.taskDetails.where((d) => d.taskId == 4).toList()),
  ];
}
