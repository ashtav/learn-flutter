import 'package:flutter/material.dart';
import 'package:learn_flutter/sqlite_example/db/init.dart';

import 'state_management_examples/cubit/routes.dart';


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
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );

    // return MaterialApp(
    //   title: 'Learn Flutter',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const ApiLoginView(),
    // );

    // menggunakan state management Bloc & Cubit
    return MaterialApp.router(
      title: 'Learn Flutter',
      theme: theme,
      routerConfig: router,
    );

    // menggunakan state management Riverpod
    // dengan GoRouter sebagai navigator
    // return ProviderScope(
    //     child: MaterialApp.router(
    //   title: 'App',
    //   theme: theme,
    //   routerConfig: router,
    // ));

    // menggunakan state management Provider
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => TodoProvider()),
    //   ],
    //   child: MaterialApp(
    //     title: 'Learn Flutter',
    //     theme: theme,
    //     initialRoute: AppRoutes.initialRoute,
    //     onGenerateRoute: AppRoutes.onGenerateRoute,
    //   ),
    // );

    // menggunakan state management GetX
    // return GetMaterialApp(
    //   title: 'Learn Flutter',
    //   theme: theme,
    //   initialRoute: AppPages.INITIAL,
    //   getPages: AppPages.routes
    // );
  }
}
