import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  const CustomInput({super.key, this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint, hintStyle: const TextStyle(color: Colors.black45)),
    );
  }
}

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final price = TextEditingController();
    final stock = TextEditingController();
    final description = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomInput(controller: name, hint: 'Type food name'),
          const SizedBox(height: 25),
          CustomInput(controller: price, hint: 'Type food price'),
          const SizedBox(height: 25),
          CustomInput(controller: stock, hint: 'Type stock'),
          const SizedBox(height: 25),
          CustomInput(controller: description, hint: 'Type food description'),
        ],
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {
          List<String> foods = ['Pizza', 'Burger', 'Fried Chicken', 'Satay', 'Coffee Latte'];
          foods.shuffle();

          Map<String, dynamic> payload = {
            'name': foods[0],
            'price': int.parse(price.text.trim().isEmpty ? '1' : price.text),
            'stock': int.parse(stock.text.trim().isEmpty ? '1' : stock.text),
            'description': description.text,
          };

          Navigator.of(context).pop(payload);
        },
        child: const Text('Submit'),
      ),
    );
  }
}
