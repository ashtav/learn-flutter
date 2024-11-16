import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
        actions: [
          IconButton(
            onPressed: () {
              todoBloc.add(AddTodo()); // AddTodo event triggers adding a new todo
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.todos.isEmpty) {
            return const Center(child: Text('No todos available.'));
          }

          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];

              return ListTile(
                title: Text(todo.title ?? '-'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    todoBloc.add(RemoveTodo(todo.id!));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
