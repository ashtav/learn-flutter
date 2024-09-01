import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  final String title;
  final String message;
  const Confirmation(this.title, this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Material(
              color: Colors.transparent,
              child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(message),
                      const SizedBox(height: 30),
                      Row(
                        children: List.generate(2, (index) {
                          List<String> labels = ['Batal', 'Ya'];

                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context, labels[index]);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black45)),
                                  padding: const EdgeInsets.all(20),
                                  child: Text(labels[index])),
                            ),
                          );
                        }),
                      )
                    ],
                  ))),
        ),
      ],
    );
  }
}
