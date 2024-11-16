import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'base_view.dart';
import 'cubit.dart';
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

// Define the router with routes, using BlocProvider for pages with Cubit dependencies
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    Route.set('/', (state) => const BaseView()),
    Route.set(
      '/todo',
      (state) => BlocProvider(
        create: (context) => TodoCubit(),
        child: const TodoPage(),
      ),
    ),
  ],
);
