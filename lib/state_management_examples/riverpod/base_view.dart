import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Example')),
      body: Center(
        child: GestureDetector(
            onTap: () {
              context.push('/todo'); // using go router
            },
            child: const Padding(
              padding: EdgeInsets.all(28.0),
              child: Text('Open Page'),
            )),
      ),
    );
  }
}
