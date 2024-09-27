// ignore_for_file: depend_on_referenced_packages

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late Database database;

class SQLite {
  static Future<void> init({bool fresh = false}) async {
    // Get the database path
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'example.db');

    // Delete the database if fresh initialization is required
    if (fresh) {
      await deleteDatabase(path);
    }

    // Open or create the database
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create the 'food' table
        await db.execute('''
          CREATE TABLE food (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name TEXT NOT NULL, 
            price REAL NOT NULL, 
            stock INTEGER NOT NULL, 
            description TEXT, 
            created_at TEXT DEFAULT CURRENT_TIMESTAMP
          )
        ''');
      },
    );

    // ignore: avoid_print
    print('SQLite database has been initialized.');
  }
}
