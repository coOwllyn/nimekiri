import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

import 'package:todo_bloc/ui/views/todo/models/task.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Task.db');
    var db = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  _createDatabase(Database db, int version) async {
    await db.execute('''
        CREATE TABLE my_task(
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL,
        isDone BOOLEAN,
        isDeleted BOOLEAN,
        isFavorite BOOLEAN
        )
       ''');
  }
  // isDone BOOLEAN,
  // isDeleted BOOLEAN,
  // isFavorite BOOLEAN,

  Future<Task> insert(Task task) async {
    var dbClient = await db;
    await dbClient?.insert('my_task', task.toMap());
    return task;
  }

  Future<List<Task>> getDataList() async {
    await db;
    final List<Map<String, Object?>> QueryResult =
        await _db!.rawQuery('SELECT * FROM my_task');
    return QueryResult.map((e) => Task.fromMap(e)).toList();
  }

  Future<int?> delete(int id) async {
    var dbClient = await db;
    return await dbClient?.delete('my_task', where: 'id = ?', whereArgs: [id]);
  }

  Future<int?> update(Task task) async {
    var dbClient = await db;
    return await dbClient?.update('my_task', task.toMap(),
        where: 'id = ?', whereArgs: [task.id]);
  }
}
