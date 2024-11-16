// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLoginView extends StatefulWidget {
  const ApiLoginView({super.key});

  @override
  State<ApiLoginView> createState() => _ApiLoginViewState();
}

class _ApiLoginViewState extends State<ApiLoginView> {
  Dio dio = Dio();

  final username = TextEditingController(text: 'emilys');
  final password = TextEditingController(text: 'emilyspass');

  void setUpDio() {
    // set konfigurasi pada dio

    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};

    dio.options = BaseOptions(
        followRedirects: false,
        connectTimeout: const Duration(seconds: 60), // seberapa lama kita ingin menunggu untuk terhubung dengan api
        receiveTimeout: const Duration(seconds: 30), // seberapa lama kita ingin menunggu untuk menerima response
        headers: headers,
        responseType: ResponseType.plain,
        validateStatus: (status) => status! <= 598);

    dio.options.headers = headers;
  }

  Future login() async {
    try {
      final response = await dio.post('https://dummyjson.com/auth/login', data: {
        'username': username.text,
        'password': password.text,
      });

      Map data = json.decode(response.data);

      if (response.statusCode == 200) {
        // biasanya terdapata token yang bisa kita gunakan untuk melakukan request lain
        // jadi simpan token itu, kita bisa menggunakan local storage
        String token = data['accessToken'];

        // simpan token
        final prefs = SharedPreferencesAsync();
        prefs.setString('token', token);

        // set authorization ke dio, supaya api yang terkunci bisa dipakai dengan token
        dio.options.headers['Authorization'] = 'Bearer $token'; // kata "Bearer" tergantung dari pengaturan backend

        // setelah itu kia bisa pergi ke halaman dashboard
        Fluttertoast.showToast(msg: 'Login berhasil');
      } else {
        Fluttertoast.showToast(msg: data['message'].toString());
      }
    } catch (e, s) {
      Fluttertoast.showToast(msg: '$e');
      print('error: $e, $s');
    }
  }

  @override
  void initState() {
    super.initState();
    setUpDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username,
                decoration: const InputDecoration(hintText: 'Inputkan username'),
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(hintText: 'Inputkan password'),
              ),
              const SizedBox(height: 25),
              TextButton(
                onPressed: () {
                  login();
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
                    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 13, horizontal: 20))),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text('Login', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
