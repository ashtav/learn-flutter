import 'package:flutter/material.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Example'),
      ),
      body: ListView(
        children: [
          // 1. Column
          // Column digunakan untuk menampilkan sesuatu secara vertikal

          const Column(
            children: [
              Text('Text 1'),
              Text('Text 2'),
            ],
          ),

          // 2. Row
          // Row digunakan untuk menampilkan sesuatu secara horizontal

          const Row(
            children: [
              Text('Text 1'),
              Text('Text 2'),
            ],
          ),

          // 3. Stack
          // Stack digunakan untuk menampilkan sesuatu dalam posisi bertumpuk
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.blue,
              ),

              // kita juga bisa menggunakan positioned untuk menentukan posisinya
              const Positioned(top: 0, right: 0, child: Text('Text 1')),

              // atau positioned align yang langsung menempatkan tampilkan pada posisi tertentu tanpa menentukan nilainya
              const Positioned.fill(
                  child: Align(
                alignment: Alignment.topRight,
                child: Text('Text 2'),
              ))
            ],
          ),

          // 4. GridView
          // GridView digunakan untuk menampilkan elemen dalam bentuk grid
          GridView.count(
              crossAxisCount: 3,
              shrinkWrap:
                  true, // Mengatur agar GridView tidak mengambil seluruh tinggi
              physics:
                  const NeverScrollableScrollPhysics(), // Menonaktifkan scroll pada GridView
              children: List.generate(9, (index) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  color: Colors.teal[(index + 1) * 100],
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              })),
        ],
      ),
    );
  }
}
