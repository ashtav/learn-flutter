// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MenuNavigator extends StatefulWidget {
  final Function(int index)? onTap;
  const MenuNavigator({super.key, this.onTap});

  @override
  State<MenuNavigator> createState() => _MenuNavigatorState();
}

class _MenuNavigatorState extends State<MenuNavigator> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.store,
      Icons.notifications,
      Icons.account_box
    ];
    List<String> menus = ['Home', 'Store', 'Notif', 'Account'];

    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black26))),
      child: Row(
        children: List.generate(icons.length, (index) {
          bool active = index == activeIndex;
          Color color = active ? Colors.black : Colors.black45;

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  activeIndex = index;
                  widget.onTap?.call(index);

                  print('menu index ke $index');
                });
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icons[index], color: color),
                      const SizedBox(height: 5),
                      Text(
                        menus[index],
                        style: TextStyle(fontSize: 13, color: color),
                      )
                    ],
                  )),
            ),
          );
        }),
      ),
    );
  }
}
