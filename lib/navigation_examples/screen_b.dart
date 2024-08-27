import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop({'message': 'Saya dari halaman B'});
                  // kembali ke halaman sebelumnya sekaligus memberikan data yang akan ditangkap di halaman sebelumnya
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Buka Halaman B'),
                ))
          ],
        ),
      ),
    );
  }
}
