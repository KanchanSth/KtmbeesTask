import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:todoapp/Model/db_model.dart';
import 'package:todoapp/Model/todo_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static sql.Database? _database;
  Future<sql.Database> get database async =>
      _database ??= await _initDatabase();

  Future<sql.Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'todoapp.db');
    return await sql.openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(sql.Database db, int version) async {
    await db.execute('''
      CREATE TABLE todoapp(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          desc TEXT,
      )
      ''');
  }

  Future<List<ToDoModel>> getTasks() async {
    sql.Database db = await instance.database;
    var tasks = await db.query('todoapp', orderBy: 'id');
    List<ToDoModel> taskList =
        tasks.isNotEmpty ? tasks.map((c) => ToDoModel.fromMap(c)).toList() : [];
    return taskList;
  }

  Future<int> add(ToDoModel toDoModel) async {
    sql.Database db = await instance.database;
    return await db.insert('todoapp', toDoModel.toMap());
  }

  Future<int> remove(int id) async {
    sql.Database db = await instance.database;
    return await db.delete('todoapp', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(ToDoModel toDoModel) async {
    sql.Database db = await instance.database;
    return await db.update('todoapp', toDoModel.toMap(),
        where: "id = ?", whereArgs: [toDoModel.id]);
  }
}
