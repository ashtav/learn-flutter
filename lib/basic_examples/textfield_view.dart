import 'package:flutter/material.dart';

class TextFieldView extends StatefulWidget {
  const TextFieldView({super.key});

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  final name = TextEditingController();

  DateTime? date;
  String gender = 'Laki-laki';
  String dropdownvalue = 'Item 1';

  List<String> selected = [];

  final List<Map<String, dynamic>> checkboxes = [
    {'name': 'Item 1', 'isChecked': false},
    {'name': 'Item 2', 'isChecked': false},
    {'name': 'Item 3', 'isChecked': false},
    {'name': 'Item 4', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    List<String> genders = ['Laki-laki', 'Perempuan'];

    List<String> items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          // membuat text input
          TextField(
            controller: name,
            decoration: const InputDecoration(
                hintText: 'Inputkan nama',
                hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal)),
          ),

          const SizedBox(height: 30),

          // membuat input pilih tanggal
          GestureDetector(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2101));
              if (picked != null) {
                setState(() {
                  date = picked;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black54))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date == null
                        ? 'Pilih tanggal lahir'
                        : date.toString().substring(0, 10),
                    style: TextStyle(
                        color: date == null ? Colors.black54 : Colors.black),
                  ),
                  const Icon(Icons.calendar_month, size: 20)
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          // membuat select option / dropdown
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black54))),
            child: DropdownButton(
              value: dropdownvalue,
              underline: Container(),
              icon: const Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),

          const SizedBox(height: 30),

          // membuat radio button
          Column(
            children: List.generate(genders.length, (i) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(genders[i])),
                  Radio(
                      activeColor: Colors.blue,
                      value: genders[i],
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      })
                ],
              );
            }),
          ),

          const SizedBox(height: 30),

          Column(
              children: List.generate(checkboxes.length, (i) {
            final checkbox = checkboxes[i];

            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(checkbox['name']),
              value: checkbox['isChecked'],
              onChanged: (bool? value) {
                setState(() {
                  checkbox['isChecked'] = value ?? false;
                });
              },
            );
          })),

          const SizedBox(height: 30),

          // membuat custom button
          GestureDetector(
            onTap: () {
              // lakukan sesuatu ketika button diklik
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              child: const Text('Submit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          )
        ],
      ),
    );
  }
}
