import 'package:flutter/material.dart';

import 'base_view.dart';
import 'view.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String todoRoute = '/todo';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const BaseView());
      case todoRoute:
        return MaterialPageRoute(builder: (_) => const TodoPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
