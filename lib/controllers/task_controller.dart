import 'package:get/get.dart';
import 'package:to_do_manager/models/task.dart';

class TaskController extends GetxController {
  final allTasks = <Task>[].obs;

  void addTask(Task task) {
    allTasks.add(task);
  }

  List<Task> get tasks {
    return allTasks;
  }
}
