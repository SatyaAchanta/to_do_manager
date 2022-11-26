import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../models/task.dart';

class AllTasks extends StatelessWidget {
  AllTasks({super.key});

  final controller =
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
        child: entries.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: controller.allTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Checkbox(
                      value: false,
                      onChanged: controller.setTaskDone(entries[index].taskId),
                    ),
                    title: Text('Entry ${entries[index].taskTitle}'),
                    subtitle: const Text('Due Date 2022-12-23'),
                    trailing: IconButton(
                        onPressed: controller.deleteTask(entries[index].taskId),
                        icon: const Icon(Icons.delete)),
                  );
                },
              )
            : Center(
                child: Column(
                children: [
                  const Text('Nothing To Do here. Add some tasks'),
                  ElevatedButton(
                    onPressed: () {
                      Get.to('/newtasks');
                    },
                    child: const Text("Add Tasks"),
                  ),
                ],
              )),
      ),
    );
  }
}
