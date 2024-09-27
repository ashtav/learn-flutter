// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_flutter/sqlite_example/db/init.dart';

import 'form_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> foods = [];

  Future getData() async {
    final data = await database.query('food');
    foods = data;

    setState(() {});
  }

  Future createData(Map<String, dynamic> data) async {
    try {
      final res = await database.insert('food', data);

      if (res != 0) {
        getData();
        Fluttertoast.showToast(msg: 'Berhasil ditambahkan.');
      }
    } catch (e, s) {
      Fluttertoast.showToast(msg: 'Terjadi kesalahan.');
      print('error: $e, trace: $s');
    }
  }

  Future updateData(int id, Map<String, dynamic> data) async {
    await database.update('food', data, where: 'id = ?', whereArgs: [id]);
    Fluttertoast.showToast(msg: 'Berhasil diperbarui.');
    getData();
  }

  Future deleteData(int id) async {
    await database.delete('food', where: 'id = ?', whereArgs: [id]);
    Fluttertoast.showToast(msg: 'Berhasil dihapus.');
    getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite - List Food'),
        actions: [
          IconButton(
              onPressed: () {
                getData();
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const FormView();
                })).then((value) {
                  if (value != null) {
                    createData(value);
                  }
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: foods.isEmpty
          ? const Center(
              child: Text('Tidak ada data.'),
            )
          : ListView(
              children: List.generate(foods.length, (int i) {
                final data = foods[i];

                String name = data['name'];
                String price = '${data['price']}';
                String stock = '${data['stock']}';

                return Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text('\$$price - Stock: $stock'),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  deleteData(data['id']);
                                },
                                child: const Icon(Icons.delete,
                                    color: Colors.redAccent))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
    );
  }
}
