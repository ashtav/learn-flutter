import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Examples'),
      ),
      body: Column(
        children: [
          // 1. ListView
          // Digunakan untuk menampilkan list dengan item yang jumlahnya tetap.
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Standard ListView:'),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
                ListTile(title: Text('Item 3')),
              ],
            ),
          ),

          const Divider(),

          // 2. ListView.builder
          // Digunakan untuk menampilkan list dengan jumlah item dinamis atau banyak.
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('ListView.generate:'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Jumlah item yang ingin ditampilkan
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Generated Item $index'),
                );
              },
            ),
          ),

          const Divider(),

          // 3. SingleChildScrollView with Column
          // Digunakan ketika kamu ingin menampilkan list kecil dengan semua item langsung dimuat, tanpa perlu efisiensi scroll.
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('SingleChildScrollView with Column:'),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // mengatur arah scroll pada list
              child: Column(
                children: List.generate(5, (index) {
                  return ListTile(
                    title: Text('SingleChildScrollView Item $index'),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
