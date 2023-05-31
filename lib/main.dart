import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/testController.dart';

import 'Second_Page.dart';

void main() {
  runApp(CounterWidget());
}

class CounterWidget extends StatelessWidget {
  CounterWidget({super.key});

  final TestController _testController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Flutter GetX State Management Demo"),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.teal,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _testController.increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Obx(() => Text('Count ${_testController.count.value}')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          backgroundColor: Colors.teal),
                      onPressed: () {
                        Get.snackbar(
                            'GetX Snackbar', 'Yay! Awesome GetX Snackbar',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.tealAccent);
                      },
                      child: const Text('Show Snackbar')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal),
                      onPressed: () {
                        Get.defaultDialog(
                            title: 'GetX Alert',
                            middleText: 'Simple GetX alert',
                            textConfirm: 'Okay',
                            confirmTextColor: Colors.white,
                            textCancel: 'Cancel');
                      },
                      child: const Text('Show AlertDialog')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const SecondPage());
                          },
                          child: Row(children: [
                            const Spacer(),
                            const Text("Go To next Screen"),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            const Expanded(
                                child: Icon(
                              Icons.arrow_right_alt,
                              size: 40,
                            ))
                          ])))
                ]))));
  }
}
