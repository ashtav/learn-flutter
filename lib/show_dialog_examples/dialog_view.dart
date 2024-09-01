// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'confirmation.dart';

class DialogView extends StatelessWidget {
  const DialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Dialog.show(context, 'Logout Account',
                    'Apakah anda yakin ingin keluar dari akun ini?',
                    confirm: (value) {
                  if (value == 'Ya') {
                    print('Keluar dari akun...');
                  }
                });
              },
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

class Dialog {
  static show(BuildContext context, String title, String message,
      {Function(String value)? confirm}) {
    showDialog(
        context: context,
        builder: (context) {
          return Confirmation(title, message);
        }).then((value) {
      if (value != null) {
        confirm?.call(value);
      }
    });
  }
}
