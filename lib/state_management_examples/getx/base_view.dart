import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/state_management_examples/getx/routes.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Example')),
      body: Center(
        child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.TODO);
            },
            child: const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text('Open Page'),
            )),
      ),
    );
  }
}
