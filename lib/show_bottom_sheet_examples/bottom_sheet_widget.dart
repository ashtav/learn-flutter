import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.white),
          // height: MediaQuery.of(context).size.height / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hello',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis similique delectus necessitatibus tempora odio fugiat voluptates quae, repudiandae impedit, accusantium a. Veritatis iure praesentium nobis aliquid officia vel quas tempora?'),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Close'),
              ),
              const SizedBox(height: 50),
            ],
          ),
        )
      ],
    );
  }
}
