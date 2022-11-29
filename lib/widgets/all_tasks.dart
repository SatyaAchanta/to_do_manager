import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';

class AllTasks extends StatelessWidget {
  AllTasks({super.key});

  final controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap on task to see details'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/newtask");
            },
            icon: const Icon(Icons.filter_alt_outlined),
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
        child: controller.tasks.isNotEmpty
            ? GetX<TaskController>(
                builder: (taskControllerContext) => ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: taskControllerContext.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckboxListTile(
                      title: Text(taskControllerContext.tasks[index].taskTitle),
                      value: taskControllerContext.tasks[index].isCompleted,
                      onChanged: (bool? selected) {
                        controller.setTaskDone(
                          taskControllerContext.tasks[index].taskId,
                          selected!,
                        );
                      },
                      secondary: IconButton(
                        onPressed: () => {
                          controller.deleteTask(
                              taskControllerContext.tasks[index].taskId),
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      // leading: CheckboxListTile(
                      //   value: taskControllerContext.tasks[index].isCompleted,
                      //   onChanged: (bool? selected) => controller.setTaskDone(
                      //       taskControllerContext.tasks[index].taskId),
                      // ),
                      // title: Text(
                      //     'Entry ${taskControllerContext.tasks[index].taskTitle}'),
                      // subtitle: const Text('Due Date 2022-12-23'),
                      // trailing: IconButton(
                      //   onPressed: () => {
                      //     controller.deleteTask(
                      //         taskControllerContext.tasks[index].taskId),
                      //   },
                      //   icon: const Icon(Icons.delete),
                      // ),
                    );
                  },
                ),
              )
            : Center(
                child: Column(
                  children: [
                    const Text('Nothing To Do here. Add some tasks'),
                    ElevatedButton(
                      onPressed: () => {
                        Get.toNamed('/newtask'),
                      },
                      child: const Text("Add Tasks"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
