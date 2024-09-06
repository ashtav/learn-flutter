// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:learn_flutter/toast_examples/toast_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageView extends StatefulWidget {
  const LocalStorageView({super.key});

  @override
  State<LocalStorageView> createState() => _LocalStorageViewState();
}

class _LocalStorageViewState extends State<LocalStorageView> {
  List<String> foods = [];

  void getData() async {
    final prefs = SharedPreferencesAsync();
    List<String> data = await prefs.getStringList('foods') ?? [];
    foods = data;

    setState(() {});
  }

  void addNewData() {
    List<String> data = [
      "Pizza",
      "Sushi",
      "Burger",
      "Pasta",
      "Ramen",
      "Taco",
      "Curry",
      "Fried Rice",
      "Steak",
      "Salad",
      "Ice Cream",
      "Chocolate",
      "Apple Pie",
      "French Fries",
      "Popcorn"
    ];

    // mendapatkan data random / acak
    data.shuffle();

    // tambahkan data
    foods.add(data[0]);

    setState(() {});
  }

  void removeData(int index) {
    foods.removeAt(index);
    setState(() {});
  }

  void saveToLocal() {
    final prefs = SharedPreferencesAsync();
    prefs.setStringList('foods', foods);
    print('Data berhasil disimpan di lokal storage');
    showToast('Data berhasil disimpan!');
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
        title: const Text('Local Storage'),
        actions: [
          IconButton(
              onPressed: () {
                saveToLocal();
              },
              icon: const Icon(Icons.save)),
          IconButton(
              onPressed: () {
                addNewData();
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                getData();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: foods.isEmpty
          ? const Center(
              child: Text('Tidak ada data yang tersedia.'),
            )
          : ListView(
              children: List.generate(foods.length, (index) {
                return Container(
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(foods[index]),
                      GestureDetector(
                          onTap: () {
                            removeData(index);
                          },
                          child: const Icon(Icons.delete, color: Colors.red))
                    ],
                  ),
                );
              }),
            ),
    );
  }
}
