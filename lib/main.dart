import 'package:flutter/material.dart';
import 'package:learn_flutter/sqlite_example/db/init.dart';

import 'sqlite_example/views/home_view.dart';

void main() async {
  // if you want to use sqlite, init first
  WidgetsFlutterBinding.ensureInitialized();
  await SQLite.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
