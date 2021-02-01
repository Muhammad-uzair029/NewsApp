import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBStudentManager {
  Database _datebase;

  Future openDB() async {
    if (_datebase == null) {
      _datebase = await openDatabase(
          join(await getDatabasesPath(), "fvrts_News.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE fvrt_bitcoin (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,url TEXT)");
        await db.execute(
            "CREATE TABLE fvrt_bussinessHeadlines (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,url TEXT)");
        await db.execute(
            "CREATE TABLE fvrt_TehCrunch (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,url TEXT)");
        await db.execute(
            "CREATE TABLE fvrt_WallStreat (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,url TEXT)");
      });
    }
  }

  Future<int> insertStudent(Student student, String check) async {
    if (check == 'Bitcoin') {
      await openDB();
      return await _datebase.insert('fvrt_bitcoin', student.toMap());
    }
    if (check == 'Bussiness') {
      await openDB();
      return await _datebase.insert('fvrt_bussinessHeadlines', student.toMap());
    }
    if (check == 'Tech') {
      await openDB();
      return await _datebase.insert('fvrt_TehCrunch', student.toMap());
    }
    if (check == 'WallStreet') {
      await openDB();
      return await _datebase.insert('fvrt_WallStreat', student.toMap());
    }
  }

  Future<List<Student>> getStudentList(String check) async {
    if (check == 'Bitcoin') {
      await openDB();
      final List<Map<String, dynamic>> maps =
          await _datebase.query('fvrt_bitcoin');

      return List.generate(maps.length, (index) {
        return Student(
            id: maps[index]['id'],
            title: maps[index]['title'],
            url: maps[index]['url']);
      });
    }
    if (check == 'Bussiness') {
      await openDB();
      final List<Map<String, dynamic>> maps =
          await _datebase.query('fvrt_bussinessHeadlines');

      return List.generate(maps.length, (index) {
        return Student(
            id: maps[index]['id'],
            title: maps[index]['title'],
            url: maps[index]['url']);
      });
    }
    if (check == 'Tech') {
      await openDB();
      final List<Map<String, dynamic>> maps =
          await _datebase.query('fvrt_TehCrunch');

      return List.generate(maps.length, (index) {
        return Student(
            id: maps[index]['id'],
            title: maps[index]['title'],
            url: maps[index]['url']);
      });
    }
    if (check == 'WallStreet') {
      await openDB();
      final List<Map<String, dynamic>> maps =
          await _datebase.query('fvrt_WallStreat');

      return List.generate(maps.length, (index) {
        return Student(
            id: maps[index]['id'],
            title: maps[index]['title'],
            url: maps[index]['url']);
      });
    }
  }

  Future<int> updateStudent(Student student) async {
    await openDB();
    return await _datebase.update('fvrt1', student.toMap(),
        where: 'id=?', whereArgs: [student.id]);
  }

  Future<void> deleteStudent(int id, String check) async {
    if (check == 'Bitcoin') {
      await openDB();
      await _datebase.delete("fvrt_bitcoin", where: "id = ? ", whereArgs: [id]);
    }
    if (check == 'Bussiness') {
      await openDB();
      await _datebase
          .delete("fvrt_bussinessHeadlines", where: "id = ? ", whereArgs: [id]);
    }
    if (check == 'Tech') {
      await openDB();
      await _datebase
          .delete("fvrt_TehCrunch", where: "id = ? ", whereArgs: [id]);
    }
    if (check == 'WallStreet') {
      await openDB();
      await _datebase
          .delete("fvrt_WallStreat", where: "id = ? ", whereArgs: [id]);
    }
  }
}

class Student {
  int id;
  String title;
  String url;

  Student({
    @required this.title,
    @required this.url,
    this.id,
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
    };
  }
}
