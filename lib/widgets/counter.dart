import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/count_controller.dart';

class Counter extends StatelessWidget {
  final controller = Get.put(CounterController());
  Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<CounterController>(
                builder: (_) => Text('clicks: ${controller.count}'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/newtask");
                },
                child: const Text('Next Route'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
