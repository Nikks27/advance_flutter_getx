
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/Controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counter = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text(
          'Counter App',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Obx(
              () => Text(
            '${counter.count}',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}