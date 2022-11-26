import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widgets/counter.dart';
import './widgets/new_task.dart';

void main() => runApp(
      GetMaterialApp(
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => Counter()),
          GetPage(name: "/newtask", page: () => const NewTask()),
        ],
      ),
    );
