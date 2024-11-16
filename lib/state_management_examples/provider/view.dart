import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
        actions: [
          IconButton(
              onPressed: () {
                provider.addTodo();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: provider.isLoading
          ? const Center(child: Text('Loading...'))
          : provider.todos.isEmpty
              ? const Center(child: Text('Tidak ada data.'))
              : ListView.builder(
                  itemCount: provider.todos.length,
                  itemBuilder: (context, index) {
                    final todo = provider.todos[index];

                    return Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(todo.title ?? '-'),
                          GestureDetector(
                            onTap: () {
                              provider.removeTodo(todo.id!);
                            },
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
