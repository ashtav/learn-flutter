// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/api_examples/models/todo.dart';

class TodoState {
  final bool isLoading;
  final List<Todo> todos;

  TodoState({this.isLoading = false, this.todos = const []});

  TodoState copyWith({bool? isLoading, List<Todo>? todos}) {
    return TodoState(
      isLoading: isLoading ?? this.isLoading,
      todos: todos ?? this.todos,
    );
  }
}

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState()) {
    print('cubit has been initialized...');
    onInit();
  }

  void onInit() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }

  void addTodo() {
    int id = DateTime.now().millisecond;

    // Simulate adding a new todo
    emit(state.copyWith(
      todos: [
        ...state.todos,
        Todo(
          id: id,
          title: 'Todo $id',
        )
      ],
      isLoading: false,
    ));
  }

  void removeTodo(int id) {
    emit(state.copyWith(
      todos: state.todos.where((todo) => todo.id != id).toList(),
    ));
  }

  @override
  Future<void> close() {
    print('Cubit has been disposed...');
    return super.close();
  }
}
