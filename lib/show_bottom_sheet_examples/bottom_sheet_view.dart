// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'bottom_sheet_widget.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Bottom Sheet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // supaya layar penuh
                    builder: (context) {
                      return const BottomSheetWidget();
                    }).then((value) {
                  if (value == true) {
                    print('Bottom sheet telah ditutup');
                  }
                });
              },
              child: const Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
