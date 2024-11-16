import 'package:get/get.dart';
import 'package:learn_flutter/state_management_examples/getx/controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
