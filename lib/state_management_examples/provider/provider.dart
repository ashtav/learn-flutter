// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:learn_flutter/api_examples/models/todo.dart';

class TodoProvider with ChangeNotifier {

  TodoProvider(){
    print('Provider has been initialized...');
  }

  List<Todo> todos = [];
  bool isLoading = false;

  List<Todo> get getTodos => todos;
  bool get loading => isLoading;

  void addTodo() {
    isLoading = true;
    notifyListeners();

    int id = DateTime.now().millisecond;
    todos.add(Todo(
      id: id,
      title: 'Todo $id',
    ));

    isLoading = false;
    notifyListeners();
  }

  void removeTodo(int id) {
    todos.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  @override
  void dispose() {
    print('Provider has been disposed...');
    super.dispose();
  }
}
