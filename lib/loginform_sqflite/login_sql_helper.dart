import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class LoginSQLHelper {

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE data(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        email TEXT,
        password TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// name, email and password of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'loginform.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createForm(String name, String email, String password) async {
    final db = await LoginSQLHelper.db();

    final data = {'name': name, 'email': email, 'password': password};
    final id = await db.insert('data', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getdata() async {
    final db = await LoginSQLHelper.db();
    return db.query('data', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getData(id) async {
    final db = await LoginSQLHelper.db();
    return db.query('data', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<String> getUser(String email, String password) async {
    final db = await LoginSQLHelper.db();
    var res = await db.rawQuery("SELECT * FROM data WHERE email = '$email' and password = '$password'");
    if (res.length > 0) {
      return "1";
    }
    return "0";
  }


  // Delete
  static Future<void> deleteData(int id) async {
    final db = await LoginSQLHelper.db();
    try {
      await db.delete("data", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}