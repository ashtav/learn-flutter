import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_flutter/state_management_examples/riverpod/extension.dart';

import 'provider.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(todoProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Example'),
        actions: [
          IconButton(
              onPressed: () {
                notifier.addTodo();
              },
              icon: const Icon(Icons.add))
        ],
      ),

      // dengan cara seperti ini, hanya body yang dirender ulang
      // sehingga performance app menjadi lebih baik
      body: todoProvider.consume((ref, p, n) {
        bool isLoading = ref.watch(p.select((s) => s.isLoading));
        final todos = ref.watch(p.select((s) => s.todos));

        if (isLoading) {
          return const Center(child: Text('Loading...'));
        }

        if (todos.isEmpty) {
          return const Center(child: Text('Tidak ada data.'));
        }

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];

            return Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(todo.title ?? '-'),
                  GestureDetector(
                    onTap: () {
                      notifier.removeTodo(todo.id!);
                    },
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
