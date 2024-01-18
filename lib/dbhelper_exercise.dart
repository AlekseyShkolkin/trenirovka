import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'model_exercise.dart';

class DbHelperExercise {
  static final DbHelperExercise _dbHelperExercise =
      DbHelperExercise._internal();
  String tblExercise = 'day';
  String colId = 'id';
  String colTitle = 'title';
  String colname = 'name';

  DbHelperExercise._internal();

  factory DbHelperExercise() {
    return _dbHelperExercise;
  }

  static Database _db;

  Future<Database> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = dir.path + '/exercise.db';
    final Database dbExercise =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dbExercise;
  }

  Future<void> _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tblExercise($colId INTEGER PRIMARY KEY, $colTitle TEXT' +
            '$colname TEXT)');
  }

  Future<int> insertExercise(Exercise exercise) async {
    final Database db = await this.db;
    final int result = await db?.insert(tblExercise, exercise.toMap()) ?? 0;
    return result;
  }

  Future<List<Map<String, Object>>> getExercise() async {
    final Database db = await this.db;
    final List<Map<String, Object>> result = await db
        ?.rawQuery('SELECT * FROM $tblExercise ORDER BY $colId DESC'); /*ASC */
    return result;
  }

  Future<int> getCount() async {
    Database db = await (this.db as FutureOr<Database>);
    final int result = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT (*) FROM $tblExercise'));
    return result;
  }

  Future<int> getTodoCountExercise() async {
    final Database db = await this.db;
    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT COUNT(*) FROM $tblExercise');
    final int countExercise = Sqflite.firstIntValue(result);
    return countExercise;
  }

  Future<int> updateExercise(Exercise exercise) async {
    final Database db = await this.db;
    final int result = await db?.update(tblExercise, exercise.toMap(),
            where: '$colId = ?', whereArgs: [exercise.id]) ??
        0;
    return result;
  }

  Future<int> deleteExercise(int id) async {
    int result;
    final Database db = await this.db;
    result =
        await db?.rawDelete('DELETE FROM $tblExercise WHERE $colId = $id') ?? 0;
    return result;
  }
}
