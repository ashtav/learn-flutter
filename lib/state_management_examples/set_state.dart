import 'package:flutter/material.dart';

class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  State<SetStateExample> createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int counter = 0;

  void updateCounter() {
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set State'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('$counter', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            const SizedBox(height: 30),

            GestureDetector(
                onTap: () => updateCounter(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Update Counter'),
                ))
          ],
        ),
      ),
    );
  }
}
