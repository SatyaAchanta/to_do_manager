import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/task.dart';
import '../controllers/task_controller.dart';

// Define a custom Form widget.
class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  NewTaskState createState() {
    return NewTaskState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class NewTaskState extends State<NewTask> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<NewTaskState>.
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(TaskController());
  final taskTitleController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Task",
          style: TextStyle(
            fontSize: 32.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(24.0),
                child: TextFormField(
                  controller: taskTitleController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.info_outline),
                    hintText: 'Go to gym',
                    labelText: 'Task Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Task Title';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(24.0),
                child: TextFormField(
                  controller: taskDescriptionController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.info_outline),
                    hintText: 'I want to continue my fitness',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Briefly Describe the task';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    controller.addTask(
                      Task(
                        const Uuid().v4(),
                        taskTitleController.text,
                        taskDescriptionController.text,
                        false,
                        [],
                      ),
                    );
                    Get.offAndToNamed("/");
                  }
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
