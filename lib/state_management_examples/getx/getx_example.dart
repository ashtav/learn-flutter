import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

/* contoh penggunaan GetX ini melibatkan View, Controller, Binding, dan Routes

1. View
View adalah tampilan UI aplikasi yang akan berinteraksi dengan pengguna. Di dalam GetX, 
View biasanya adalah widget yang merender data dari Controller dan menggunakan `Obx` untuk memantau perubahan 
data secara reaktif. Saat data di Controller berubah, UI di View akan otomatis ter-update.

2. Controller
Controller adalah tempat di mana logika bisnis dan pengelolaan data aplikasi ditempatkan. Dalam GetX, 
Controller bertanggung jawab atas manipulasi dan pengaturan data yang dibutuhkan oleh View. 
Controller ini akan diakses dari View, memungkinkan View mengambil data atau memanggil fungsi dari Controller.

3. Binding
Binding adalah cara untuk menghubungkan Controller dengan route atau view tertentu dalam aplikasi. 
Dengan menggunakan Binding, kita bisa memastikan Controller hanya diinisialisasi ketika diperlukan, 
yang dapat meningkatkan efisiensi memori. Binding biasanya diterapkan pada route-level, 
jadi setiap kali route diakses, Binding akan mengatur Controller yang relevan.

4. Routes
Routes dalam GetX digunakan untuk navigasi antar halaman atau view dalam aplikasi. Dengan menggunakan GetX, 
kita bisa mendefinisikan route secara lebih efisien dan membuat navigasi tanpa harus mendefinisikan banyak `Navigator`. 
GetX mempermudah pengelolaan route dengan cara yang lebih terstruktur dan terpusat.

Contoh alur lengkap:
- View akan mengakses data dari Controller melalui Obx.
- Controller dihubungkan ke route melalui Binding.
- Routes memungkinkan navigasi dari satu view ke view lainnya, dengan Binding yang mengatur Controller untuk setiap route.

Note: Kita akan menggunakan Get CLI untuk mempermudah setup dan struktur proyek GetX. 
Get CLI adalah alat baris perintah yang disediakan oleh GetX untuk membantu membuat folder, 
file, dan binding secara otomatis, yang dapat menghemat waktu dalam mengatur berbagai bagian 
aplikasi seperti controller, view, dan routes.

Dengan Get CLI, kita bisa langsung membuat file controller, binding, dan view yang terstruktur dan terhubung 
dengan satu perintah. Ini sangat berguna untuk proyek dengan arsitektur yang lebih besar karena mengurangi 
waktu setup dan meningkatkan keteraturan struktur proyek.

*/

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Example'),
        actions: [
          IconButton(
              onPressed: () {
                controller.addTodo();
              },
              icon: const Icon(Icons.add))
        ],
      ),

      /*
        Penjelasan tentang penggunaan Obx dalam GetX:

        1. Fungsi Obx dalam GetX
          `Obx` adalah widget dalam GetX yang digunakan untuk membuat tampilan reaktif. `Obx` bekerja sebagai 
          "listener" yang memantau perubahan nilai variabel Rx dalam controller. Setiap kali variabel Rx yang ada 
          di dalam `Obx` berubah nilainya, UI yang terbungkus dalam `Obx` akan secara otomatis diperbarui. 
          Ini menghilangkan kebutuhan untuk memanggil `setState` dan membuat UI yang lebih responsif dan efisien.

        2. Mengapa Menggunakan Obx?
          `Obx` membantu untuk menghemat proses update UI dengan hanya memantau variabel yang berubah. Pada contoh ini, 
          `Obx` digunakan untuk memantau variabel `isLoading` dan `todos` dari `controller`. Jadi, jika `isLoading` 
          atau data `todos` diubah di dalam controller, `Obx` akan langsung memperbarui tampilan sesuai dengan kondisi 
          yang terbaru, tanpa perlu menggunakan metode `setState`.

        3. Contoh Penggunaan di dalam UI
          Dalam kode ini:
          - `isLoading`: Ketika `isLoading` bernilai `true`, aplikasi akan menampilkan teks "Loading..." sebagai 
          indikator bahwa data sedang diproses atau dimuat.

          - `todos`: Jika list `todos` kosong, UI menampilkan pesan "Tidak ada data." Namun, jika list `todos` berisi 
          item, `Obx` akan menampilkan daftar tersebut dalam bentuk `ListView`.

        4. Struktur dalam `ListView`
          - `ListView` di sini diisi menggunakan `List.generate`, yang mengiterasi `todos` berdasarkan jumlah item di dalamnya.
          - Setiap item `todo` ditampilkan sebagai `Container` dengan judul `title`. Jika item tidak memiliki 
          judul (`title` bernilai null), maka `-` akan ditampilkan sebagai nilai default.

          - Tombol `delete` pada setiap item menggunakan `GestureDetector`, yang memanggil fungsi `removeTodo` 
          di controller untuk menghapus item dari `todos`. Perubahan ini otomatis terpantau oleh `Obx`, dan 
          UI diperbarui untuk menampilkan list yang baru.

        Secara keseluruhan, penggunaan `Obx` membuat pengelolaan tampilan dan logika aplikasi menjadi lebih bersih, 
        efisien, dan reaktif.
      */

      body: Obx(() {
        bool isLoading = controller.isLoading.value;

        if (isLoading) {
          return const Center(child: Text('Loading...'));
        }

        final todos = controller.todos;

        if (todos.isEmpty) {
          return const Center(child: Text('Tidak ada data.'));
        }

        return ListView(
          children: List.generate(todos.length, (index) {
            final todo = todos[index];
            String title = todo.title ?? '-';

            return Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  GestureDetector(
                      onTap: () {
                        controller.removeTodo(todo.id!);
                      },
                      child: const Icon(Icons.delete))
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
