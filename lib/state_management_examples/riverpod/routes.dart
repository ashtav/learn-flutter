import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'base_view.dart';
import 'view.dart';

class Route {
  static GoRoute set(String path, Widget Function(GoRouterState state) builder,
      {FutureOr<String?> Function(GoRouterState)? redirect}) {
    return GoRoute(
      path: path,
      builder: (BuildContext context, GoRouterState state) => builder(state),
      redirect: (_, GoRouterState state) => redirect?.call(state),
    );
  }
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    Route.set('/', (state) => const BaseView()),
    Route.set('/todo', (state) => const TodoPage()),
  ],
);
