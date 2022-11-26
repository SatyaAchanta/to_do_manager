import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../models/task.dart';

class AllTasks extends StatelessWidget {
  AllTasks({super.key});

  final TaskController controller =
      Get.put(TaskController()); // Rather Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    List<Task> entries = controller.tasks;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap on task to see details'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/newtask");
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
        child: entries.length > 0
            ? ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: controller.allTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Checkbox(value: false, onChanged: null),
                    title: Text('Entry ${entries[index].taskTitle}'),
                    subtitle: const Text('Due Date 2022-12-23'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.delete)),
                  );
                },
              )
            : const Center(
                child: Text('Nothing To Do here'),
              ),
      ),
    );
  }
}
