// ignore_for_file: avoid_print

import 'package:learn_flutter/api_examples/models/todo.dart';
import 'package:riverpod/riverpod.dart';

class State {
  final bool isLoading;
  final List<Todo> todos;

  State({this.isLoading = false, this.todos = const []});

  State apply({bool? isLoading, List<Todo>? todos}) {
    return State(isLoading: isLoading ?? this.isLoading, todos: todos ?? this.todos);
  }
}

// Define a StateNotifier to manage the list of Todos and loading state
class TodoNotifier extends StateNotifier<State> {
  TodoNotifier() : super(State()) {
    print('riverpod provider has been initialized...');
  }

  void addTodo() {
    state = state.apply(isLoading: true);
    int id = DateTime.now().millisecond;

    // Update the state with a new todo
    state = state.apply(todos: [
      ...state.todos,
      Todo(
        id: id,
        title: 'Todo $id',
      )
    ]);

    state = state.apply(isLoading: false);
  }

  void removeTodo(int id) {
    state = state.apply(todos: state.todos.where((todo) => todo.id != id).toList());
  }
}

// Define a provider for accessing TodoNotifier
final todoProvider = StateNotifierProvider.autoDispose<TodoNotifier, State>((ref) {
  ref.onDispose(() {
    print('riverpod provider has been disposed...');
  });

  return TodoNotifier();
});
