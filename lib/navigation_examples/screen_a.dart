// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'screen_b.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ScreenB();
                  })).then((value){
                    if(value != null){
                      print(value); // menampilkan data yang diberikan di halaman ScreenB
                    }
                  });
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
