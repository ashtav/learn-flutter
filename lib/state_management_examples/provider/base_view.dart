import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';
import 'view.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Example')),
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider<TodoProvider>(
                    create: (_) => TodoProvider(),
                    child: const TodoPage(),
                  ),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text('Open Page'),
            )),
      ),
    );
  }
}
