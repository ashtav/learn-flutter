import 'package:flutter/material.dart';

import 'menu_navigator.dart';
import 'pages/account_view.dart';
import 'pages/home_view.dart';
import 'pages/notif_view.dart';
import 'pages/store_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageActive = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      DashboardView(), // index 0
      StoreView(), // index 1
      NotifView(), // index 2
      AccountView() // index 3
    ];

    return Scaffold(
      body: Stack(
          children: List.generate(pages.length, (index) {
        int active = pageActive;
        Widget page = pages[index];

        return IgnorePointer(
          ignoring: index != active,
          child: Opacity(
            opacity: active == index ? 1 : 0,
            child: Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                    builder: (_) => page, settings: settings);
              },
            ),
          ),
        );
      })),
      bottomNavigationBar: MenuNavigator(onTap: (index) {
        setState(() {
          pageActive = index;
        });
      }),
    );
  }
}
