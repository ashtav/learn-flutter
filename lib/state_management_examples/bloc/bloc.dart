// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/api_examples/models/todo.dart';

abstract class TodoEvent {}

class AddTodo extends TodoEvent {}

class RemoveTodo extends TodoEvent {
  final int id;
  RemoveTodo(this.id);
}

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

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    print('Bloc has been initialized...');

    on<AddTodo>((event, emit) {
      emit(state.copyWith(isLoading: true));
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
    });

    on<RemoveTodo>((event, emit) {
      emit(state.copyWith(
        todos: state.todos.where((todo) => todo.id != event.id).toList(),
      ));
    });
  }

  @override
  Future<void> close() {
    print('Bloc has been disposed...');
    return super.close();
  }
}
