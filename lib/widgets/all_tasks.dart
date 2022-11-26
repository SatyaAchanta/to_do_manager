import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  AllTasks({super.key});

  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M'
  ];
  final List<int> colorCodes = <int>[600, 500, 100];

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
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Checkbox(value: false, onChanged: null),
              title: Text('Entry ${entries[index]}'),
              subtitle: const Text('Due Date 2022-12-23'),
              trailing:
                  const IconButton(onPressed: null, icon: Icon(Icons.delete)),
            );
          },
        ),
      ),
    );
  }
}
