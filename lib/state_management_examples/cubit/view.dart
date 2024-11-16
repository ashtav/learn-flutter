import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Example'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<TodoCubit>().addTodo();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          // You could add additional actions here based on the state
        },
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

              return Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(todo.title ?? '-'),
                    GestureDetector(
                      onTap: () {
                        context.read<TodoCubit>().removeTodo(todo.id!);
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
