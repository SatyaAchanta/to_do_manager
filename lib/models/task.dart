import 'package:uuid/uuid.dart';

class Task {
  Uuid taskId;
  String taskTitle;
  String taskDescription;
  List<String>? tags;
  bool isCompleted;

  Task(this.taskId, this.taskTitle, this.taskDescription, this.isCompleted,
      this.tags);
}
