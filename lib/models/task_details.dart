class TaskDetails {
  final int _id;
  final int _taskId;
  String _description;
  final DateTime _createdAt;
  bool _isDone;
  DateTime? _doneAt;

  // Fake data
  static List<TaskDetails> taskDetails = [
    TaskDetails(1, 1, "Task 1", isDone: false),
    TaskDetails(2, 1, "Task 2", isDone: true),
    TaskDetails(3, 2, "Task 3", isDone: true),
    TaskDetails(4, 1, "Task 4", isDone: false),
    TaskDetails(5, 3, "Task 5", isDone: true),
    TaskDetails(6, 1, "Task 6", isDone: true),
    TaskDetails(7, 2, "Task 7", isDone: true),
    TaskDetails(8, 1, "Task 8", isDone: true),
    TaskDetails(9, 3, "Task 9", isDone: false),
    TaskDetails(10, 1, "Task 10", isDone: true),
    TaskDetails(11, 2, "Task 11", isDone: true),
    TaskDetails(12, 2, "Task 12", isDone: false),
    TaskDetails(13, 1, "Task 1", isDone: false),
    TaskDetails(14, 1, "Task 1", isDone: false),
    TaskDetails(15, 1, "Task 1", isDone: false),
    TaskDetails(16, 1, "Task 1", isDone: false),
  ];

  // Constructor với initializer list
  TaskDetails(this._id, this._taskId, this._description, {bool isDone = false})
      : _createdAt = DateTime.now(),
        _isDone = isDone,
        _doneAt = isDone ? DateTime.now() : null;

  // Getters
  int get id => _id;
  int get taskId => _taskId;
  String get description => _description;
  DateTime get createdAt => _createdAt;
  bool get isDone => _isDone;
  DateTime? get doneAt => _doneAt;

  // Setters
  set description(String desc) => _description = desc;

  set isDone(bool done) {
    _isDone = done;
    _doneAt = done ? DateTime.now() : null;
  }

  @override
  String toString() {
    return 'TaskDetails{id: $_id, taskId: $_taskId, description: $_description, isDone: $_isDone, doneAt: $_doneAt}';
  }
}
