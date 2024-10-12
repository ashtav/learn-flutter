import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/api_examples/models/todo.dart';

/*
  Penjelasan Singkat:

  1. Apa itu API?
     API (Application Programming Interface) adalah sekumpulan aturan yang memungkinkan satu aplikasi
     berkomunikasi dengan aplikasi lain. API memungkinkan kita mengirim permintaan (request) ke server 
     dan menerima tanggapan (response).

  2. Method yang Digunakan:
     Di dalam API, terdapat beberapa method HTTP yang sering digunakan:
     - GET: Untuk meminta data dari server. Contoh: mengambil daftar produk.
     - POST: Untuk mengirim data baru ke server. Contoh: membuat akun baru.
     - PUT: Untuk memperbarui data yang ada di server. Contoh: memperbarui profil pengguna.
     - DELETE: Untuk menghapus data dari server. Contoh: menghapus akun pengguna.

  3. Payload:
     Payload adalah data yang dikirim saat menggunakan metode seperti POST atau PUT. Data ini biasanya 
     dikirim dalam format JSON atau XML dan berisi informasi yang diperlukan untuk melakukan operasi tertentu.

     Contoh payload dalam format JSON:
     {
       "name": "John Doe",
       "email": "john@example.com"
     }

  4. Query Parameters:
     Query parameters digunakan untuk mengirim data tambahan melalui URL saat menggunakan metode seperti GET.
     Query parameters ditambahkan di akhir URL dengan tanda `?` diikuti oleh pasangan key=value.

     Contoh URL dengan query parameter:
     https://api.example.com/products?category=electronics&sort=price_asc
     Di sini, `category` dan `sort` adalah query parameters.

  5. Path Parameters:
     Path parameters adalah bagian dari URL yang dinamis, digunakan untuk mengidentifikasi sumber daya tertentu.
     Misalnya, untuk mengambil data pengguna dengan ID tertentu, path parameter digunakan di bagian URL.

     Contoh URL dengan path parameter:
     https://api.example.com/users/123
     Di sini, `123` adalah path parameter yang mengidentifikasi pengguna dengan ID 123.

  6. Headers:
     Headers adalah informasi tambahan yang dikirim bersama request, seperti otentikasi (token), tipe konten
     (Content-Type), dan lain-lain.

     Contoh header:
     Authorization: Bearer your_token_here
     Content-Type: application/json

  7. Status Code:
     Setiap respons API biasanya dilengkapi dengan status code yang memberikan informasi tentang hasil operasi.
     Beberapa contoh status code umum:
     - 200 OK: Permintaan berhasil.
     - 201 Created: Data baru berhasil dibuat.
     - 400 Bad Request: Permintaan tidak valid.
     - 401 Unauthorized: Otentikasi gagal.
     - 404 Not Found: Sumber daya tidak ditemukan.
     - 500 Internal Server Error: Kesalahan di sisi server.

*/

class ApiHomeView extends StatefulWidget {
  const ApiHomeView({super.key});

  @override
  State<ApiHomeView> createState() => _ApiHomeViewState();
}

class _ApiHomeViewState extends State<ApiHomeView> {
  String apiURL = 'https://jsonplaceholder.typicode.com/todos';

  final dio = Dio();

  bool isLoading = false;
  List<Todo> todos = [];

  Future getDataTodo() async {
    setState(() {
      isLoading = true;
    });

    // lakukan request api
    final response = await dio.get(apiURL);

    // tampung hasilnya dalam list data
    List data = response.data ?? [];

    // taruh data yang kita terima di list todos
    // karena data yang kita adalah List<Map>, sedangkan todos adalah List<Todo>
    // maka kita perlu convert, menyesuaikan dengan List<Todo>
    todos = data.map((e) => Todo.fromJson(e)).toList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Home View'),
        actions: [
          IconButton(
              onPressed: () {
                getDataTodo();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child:

            // tampilan untuk loading
            isLoading
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                      SizedBox(height: 25),
                      Text('Loading data, please wait...')
                    ],
                  )
                :

                // tampilan ketika data kosong
                todos.isEmpty
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('Tidak ada data, coba refresh ulang.')],
                      )
                    :

                    // tampilan ketika ada data
                    ListView(children: [
                        // tampilan total data
                        Container(
                            padding: const EdgeInsets.all(20),
                            child: Text('Jumlah Data, ${todos.length}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))),

                        // list data yang digenerate dari todos
                        ...List.generate(todos.length, (i) {
                          Todo todo = todos[i];

                          String title = todo.title ?? '-';
                          bool isComplete = todo.completed ?? false;

                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.black12))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(title),
                                ),
                                Icon(isComplete
                                    ? Icons.check_box
                                    : Icons.square_outlined)
                              ],
                            ),
                          );
                        }),
                      ]),
      ),
    );
  }
}
