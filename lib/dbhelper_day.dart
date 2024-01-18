import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './model_day.dart';

class DbHelperDay {
  static final DbHelperDay _dbHelperDay = DbHelperDay._internal();
  String tblDay = 'day';
  String colId = 'id';
  String colTitleDay = 'titleday';
  String colName = 'name';
  String colDate = 'date';
  String coldateTren = 'dateTren';
  String colWeightTotal = 'weightTotal';

  String colNameExercise1 = 'nameExercise1';
  String colNameExercise2 = 'nameExercise2';
  String colNameExercise3 = 'nameExercise3';
  String colNameExercise4 = 'nameExercise4';
  String colNameExercise5 = 'nameExercise5';
  String colNameExercise6 = 'nameExercise6';
  String colNameExercise7 = 'nameExercise7';
  String colNameExercise8 = 'nameExercise8';
  String colNameExercise9 = 'nameExercise9';
  String colNameExercise10 = 'nameExercise10';
  String colNameExercise11 = 'nameExercise11';
  String colNameExercise12 = 'nameExercise12';
  String colNameExercise13 = 'nameExercise13';
  String colNameExercise14 = 'nameExercise14';
  String colNameExercise15 = 'nameExercise15';
  String colNameExercise16 = 'nameExercise16';
  String colNameExercise17 = 'nameExercise17';
  String colNameExercise18 = 'nameExercise18';
  String colNameExercise19 = 'nameExercise19';
  String colNameExercise20 = 'nameExercise20';

  String colWeight1 = 'weight1';
  String colWeight2 = 'weight2';
  String colWeight3 = 'weight3';
  String colWeight4 = 'weight4';
  String colWeight5 = 'weight5';
  String colWeight6 = 'weight6';
  String colWeight7 = 'weight7';
  String colWeight8 = 'weight8';
  String colWeight9 = 'weight9';
  String colWeight10 = 'weight10';
  String colWeight11 = 'weight11';
  String colWeight12 = 'weight12';
  String colWeight13 = 'weight13';
  String colWeight14 = 'weight14';
  String colWeight15 = 'weight15';
  String colWeight16 = 'weight16';
  String colWeight17 = 'weight17';
  String colWeight18 = 'weight18';
  String colWeight19 = 'weight19';
  String colWeight20 = 'weight20';

  String colNumbAppr1 = 'numbAppr1';
  String colNumbAppr2 = 'numbAppr2';
  String colNumbAppr3 = 'numbAppr3';
  String colNumbAppr4 = 'numbAppr4';
  String colNumbAppr5 = 'numbAppr5';
  String colNumbAppr6 = 'numbAppr6';
  String colNumbAppr7 = 'numbAppr7';
  String colNumbAppr8 = 'numbAppr8';
  String colNumbAppr9 = 'numbAppr9';
  String colNumbAppr10 = 'numbAppr10';
  String colNumbAppr11 = 'numbAppr11';
  String colNumbAppr12 = 'numbAppr12';
  String colNumbAppr13 = 'numbAppr13';
  String colNumbAppr14 = 'numbAppr14';
  String colNumbAppr15 = 'numbAppr15';
  String colNumbAppr16 = 'numbAppr16';
  String colNumbAppr17 = 'numbAppr17';
  String colNumbAppr18 = 'numbAppr18';
  String colNumbAppr19 = 'numbAppr19';
  String colNumbAppr20 = 'numbAppr20';

  String colNumbRepit1 = 'numbRepit1';
  String colNumbRepit2 = 'numbRepit2';
  String colNumbRepit3 = 'numbRepit3';
  String colNumbRepit4 = 'numbRepit4';
  String colNumbRepit5 = 'numbRepit5';
  String colNumbRepit6 = 'numbRepit6';
  String colNumbRepit7 = 'numbRepit7';
  String colNumbRepit8 = 'numbRepit8';
  String colNumbRepit9 = 'numbRepit9';
  String colNumbRepit10 = 'numbRepit10';
  String colNumbRepit11 = 'numbRepit11';
  String colNumbRepit12 = 'numbRepit12';
  String colNumbRepit13 = 'numbRepit13';
  String colNumbRepit14 = 'numbRepit14';
  String colNumbRepit15 = 'numbRepit15';
  String colNumbRepit16 = 'numbRepit16';
  String colNumbRepit17 = 'numbRepit17';
  String colNumbRepit18 = 'numbRepit18';
  String colNumbRepit19 = 'numbRepit19';
  String colNumbRepit20 = 'numbRepit20';

  DbHelperDay._internal();

  factory DbHelperDay() {
    return _dbHelperDay;
  }

  static Database _db;

  Future<Database> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = dir.path + '/day.db';
    final Database dbDays =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return dbDays;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tblDay (
        $colId INTEGER PRIMARY KEY,
        $colTitleDay TEXT,
        $colName TEXT,
        $colDate TEXT,
        $coldateTren TEXT,
        $colNameExercise1 TEXT,
        $colNameExercise2 TEXT,
        $colNameExercise3 TEXT,
        $colNameExercise4 TEXT,
        $colNameExercise5 TEXT,
                $colNameExercise6 TEXT,
        $colNameExercise7 TEXT,
        $colNameExercise8 TEXT,
        $colNameExercise9 TEXT,
        $colNameExercise10 TEXT,
                $colNameExercise11 TEXT,
        $colNameExercise12 TEXT,
        $colNameExercise13 TEXT,
        $colNameExercise14 TEXT,
        $colNameExercise15 TEXT,
                $colNameExercise16 TEXT,
        $colNameExercise17 TEXT,
        $colNameExercise18 TEXT,
        $colNameExercise19 TEXT,
        $colNameExercise20 TEXT,
        $colWeight1 TEXT,
        $colWeight2 TEXT,
        $colWeight3 TEXT,
        $colWeight4 TEXT,
        $colWeight5 TEXT,
        $colWeight6 TEXT,
        $colWeight7 TEXT,
        $colWeight8 TEXT,
        $colWeight9 TEXT,
        $colWeight10 TEXT,        
        $colWeight11 TEXT,
        $colWeight12 TEXT,
        $colWeight13 TEXT,
        $colWeight14 TEXT,
        $colWeight15 TEXT,       
        $colWeight16 TEXT,
        $colWeight17 TEXT,
        $colWeight18 TEXT,
        $colWeight19 TEXT,
        $colWeight20 TEXT,
        $colNumbAppr1 TEXT,
        $colNumbAppr2 TEXT,
        $colNumbAppr3 TEXT,
        $colNumbAppr4 TEXT,
        $colNumbAppr5 TEXT,
        $colNumbAppr6 TEXT,
        $colNumbAppr7 TEXT,
        $colNumbAppr8 TEXT,
        $colNumbAppr9 TEXT,
        $colNumbAppr10 TEXT,
        $colNumbAppr11 TEXT,
        $colNumbAppr12 TEXT,
        $colNumbAppr13 TEXT,
        $colNumbAppr14 TEXT,
        $colNumbAppr15 TEXT,
        $colNumbAppr16 TEXT,
        $colNumbAppr17 TEXT,
        $colNumbAppr18 TEXT,
        $colNumbAppr19 TEXT,
        $colNumbAppr20 TEXT,
        $colNumbRepit1 TEXT,
        $colNumbRepit2 TEXT,
        $colNumbRepit3 TEXT,
        $colNumbRepit4 TEXT,
        $colNumbRepit5 TEXT,
        $colNumbRepit6 TEXT,
        $colNumbRepit7 TEXT,
        $colNumbRepit8 TEXT,
        $colNumbRepit9 TEXT,
        $colNumbRepit10 TEXT,
        $colNumbRepit11 TEXT,
        $colNumbRepit12 TEXT,
        $colNumbRepit13 TEXT,
        $colNumbRepit14 TEXT,
        $colNumbRepit15 TEXT,
        $colNumbRepit16 TEXT,
        $colNumbRepit17 TEXT,
        $colNumbRepit18 TEXT,
        $colNumbRepit19 TEXT,
        $colNumbRepit20 TEXT,
        $colWeightTotal TEXT
      )
      ''');
  }

  Future<int> insertDay(Day day) async {
    final Database db = await this.db;
    final int result = await db?.insert(tblDay, day.toMap()) ?? 0;
    return result;
  }

  Future<List<Map<String, Object>>> getDays() async {
    final Database db = await this.db;
    final List<Map<String, Object>> result = await db
        ?.rawQuery('SELECT * FROM $tblDay ORDER BY $colId ASC'); /*ASC DESC*/
    return result;
  }

  Future<int> getCount() async {
    Database db = await (this.db as FutureOr<Database>);
    final int result = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT (*) FROM $tblDay'));
    return result;
  }

  Future<int> getTodoCountDay() async {
    final Database db = await this.db;
    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT COUNT(*) FROM $tblDay');
    final int countDay = Sqflite.firstIntValue(result);
    return countDay;
  }

  Future<int> updateDay(Day day) async {
    final Database db = await this.db;
    final int result = await db?.update(tblDay, day.toMap(),
            where: '$colId = ?', whereArgs: [day.id]) ??
        0;
    return result;
  }

  Future<int> deleteDay(int id) async {
    int result;
    final Database db = await this.db;
    result = await db?.rawDelete('DELETE FROM $tblDay WHERE $colId = $id') ?? 0;
    return result;
  }
}
