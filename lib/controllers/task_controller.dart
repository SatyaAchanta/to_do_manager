import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  final allTasks = <Task>[].obs;

  void addTask(Task task) {
    allTasks.add(task);
  }

  List<Task> get tasks {
    return allTasks;
  }

  setTaskDone(Uuid taskId) {
    allTasks.firstWhere((element) => element.taskId == taskId).isCompleted =
        true;
  }

  deleteTask(Uuid taskId) {
    allTasks.removeWhere((element) => element.taskId == taskId);
  }
}
