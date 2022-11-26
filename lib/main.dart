import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_manager/widgets/all_tasks.dart';
import './widgets/new_task.dart';

void main() => runApp(
      GetMaterialApp(
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => AllTasks()),
          GetPage(name: "/newtask", page: () => NewTask()),
        ],
      ),
    );
