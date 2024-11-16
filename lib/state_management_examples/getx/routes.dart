// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:learn_flutter/state_management_examples/getx/base_view.dart';

import 'binding.dart';
import 'getx_example.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const TODO = _Paths.TODO;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const TODO = '/todo';
}

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const TODO = Routes.TODO;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const BaseView(),
      binding: TodoBinding(),
    ),

    GetPage(
      name: _Paths.TODO,
      page: () => const TodoView(),
      binding: TodoBinding(),
    ),
  ];
}
