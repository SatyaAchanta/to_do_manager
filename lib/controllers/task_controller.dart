import 'package:get/get.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  final allTasks = <Task>[].obs;

  void addTask(Task task) {
    allTasks.add(task);
  }

  List<Task> get tasks {
    return allTasks;
  }

  setTaskDone(String taskId, bool selection) {
    List<Task> tempTasks = [...allTasks];
    allTasks.clear();
    tempTasks.firstWhere((element) => element.taskId == taskId).isCompleted =
        selection;
    allTasks.addAll(tempTasks);
  }

  deleteTask(String taskId) {
    allTasks.removeWhere((element) => element.taskId == taskId);
  }
}
