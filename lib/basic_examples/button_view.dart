// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. ElevatedButton
            // ElevatedButton adalah button yang memiliki tampilan 3D dengan bayangan (shadow).
            // Biasanya digunakan untuk aksi utama pada UI.
            ElevatedButton(
              onPressed: () {
                // Aksi ketika button ditekan
                print('ElevatedButton pressed');
              },
              child: const Text('Elevated Button'),
            ),

            const SizedBox(height: 16),

            // 2. TextButton
            // TextButton (dulu dikenal sebagai FlatButton) adalah button dengan tampilan datar (flat).
            // Tidak memiliki bayangan dan cocok untuk aksi sekunder atau opsional.
            TextButton(
              onPressed: () {
                print('TextButton pressed');
              },
              child: const Text('Text Button'),
            ),

            const SizedBox(height: 16),

            // 3. InkWell
            // InkWell digunakan untuk memberikan efek ripple ketika sebuah area atau widget ditekan.
            // Bisa digunakan pada widget apapun, tidak terbatas pada button.
            InkWell(
              onTap: () {
                print('InkWell tapped');
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'InkWell Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 4. GestureDetector
            // GestureDetector digunakan untuk mendeteksi berbagai gesture seperti tap, double tap, long press, dll.
            // Berbeda dengan InkWell, GestureDetector tidak memberikan efek visual apapun secara default.
            GestureDetector(
              onTap: () {
                print('GestureDetector tapped');
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'GestureDetector Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
