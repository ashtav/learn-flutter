import 'package:get/get.dart';
import 'package:learn_flutter/api_examples/models/todo.dart';

/*
Penjelasan tambahan mengenai penggunaan Rx dan RxList di dalam GetX:

1. Rx (Reactive Variable)
   Dalam GetX, `Rx` adalah singkatan dari "Reactive Variable," yang memungkinkan data berperilaku secara reaktif. 
   Artinya, setiap perubahan nilai pada variabel Rx akan langsung terpantau, sehingga UI yang menggunakan 
   variabel tersebut otomatis diperbarui. GetX menggunakan Rx untuk membuat alur data reaktif dan 
   sinkronisasi otomatis antara data dan UI, yang sangat berguna pada pengembangan aplikasi dinamis.

2. Mengapa Menggunakan RxList
   `RxList` adalah varian dari Rx yang didesain untuk mengelola daftar atau list yang sifatnya reaktif. 
   List ini mendukung seluruh fitur manipulasi list (seperti `add`, `remove`, dll.), namun dengan kelebihan bahwa 
   setiap perubahan pada list akan otomatis terpantau oleh UI. Dengan `RxList`, kita bisa memanipulasi list tanpa 
   perlu melakukan setState atau metode update lainnya.

3. Rx Mendukung Tipe Data Primitif
   Rx di GetX memang hanya mendukung tipe data primitif secara langsung, seperti `int`, `double`, `bool`, dan `String`. 
   Untuk tipe data lain (seperti objek `Todo` dalam contoh), kita perlu membungkusnya di dalam tipe Rx yang mendukung 
   koleksi, seperti `RxList` untuk list, atau `RxMap` untuk peta data. Hal ini memungkinkan tipe data tersebut menjadi 
   reaktif, meskipun secara tidak langsung melalui koleksi reaktif.

4. Contoh Implementasi di Controller
   Pada contoh `TodoController`, kita mendefinisikan:
   - `todos`: menggunakan `RxList` untuk menampung daftar objek `Todo`, yang memungkinkan setiap perubahan pada list 
      ini (penambahan atau penghapusan item) langsung ter-update di UI.

   - `isLoading`: variabel boolean yang dibungkus dalam `RxBool` untuk menandakan status loading dan bersifat reaktif.

   Dengan `RxList`, setiap kali kita menambahkan atau menghapus item di list `todos`, perubahan tersebut otomatis 
   terlihat di UI tanpa perlu pengaturan tambahan. Ini membuat alur kerja menjadi lebih bersih dan efisien.
*/

class TodoController extends GetxController {
  RxList<Todo> todos = RxList([]);
  RxBool isLoading = false.obs;

  void addTodo() {
    int id = DateTime.now().millisecond;
    todos.add(Todo(id: id, title: 'Todo $id'));
  }

  void removeTodo(int id) {
    todos.removeWhere((e) => e.id == id);
  }
}
