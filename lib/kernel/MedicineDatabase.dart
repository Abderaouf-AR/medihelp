import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import 'Medicine.dart';


class DatabaseHelperMedicine{

  static final DatabaseHelperMedicine _instance = new DatabaseHelperMedicine.internal();
  factory  DatabaseHelperMedicine() => _instance;  //pour que à chaque fois on lance l'app on ne creera pas une nouvelle instace(databae), on utilisera une seule pour toute la durée d'utilidation d'app
  static Database _db;
  /***DB's tables names**/
  final String MedicinesTable = "MedicinesTable";
  final String columnId = "id";
  final String columnName = "name";
  final String columnStartDate = "startDate";
  final String columnQtePerDay = "qtePerDay";
  final String columnFirstTime = "firstTime";
  final String columnSecondTime = "secondTime";
  final String columnThirdTime = "thirdTime";

  /******/

  Future<Database> get db async{
    if (_db != null ){
      return _db;
    }else{
      _db = await initDB();
      return _db;
    }
  }

  DatabaseHelperMedicine.internal();

  initDB() async {
    Directory documentdiretory = await getApplicationDocumentsDirectory();
    String path = join(documentdiretory.path, "MedicinesDB.db");

    var ourDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDB;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $MedicinesTable($columnId INTEGER PRIMARY KEY,$columnName TEXT, $columnStartDate TEXT, $columnQtePerDay INTEGER, $columnFirstTime TEXT, $columnSecondTime TEXT, $columnThirdTime TEXT)"
    );
  }

  //CRUD / CREATE, READ, UPDATE AND DELETE

  //INSERTION
  Future<int> saveMedicine(Medicine medicine) async {
    var dbBook = await db;
    var result = await dbBook.insert("$MedicinesTable", medicine.toMap());
    return result;
  }

  //GET BOOKS
  Future<List> getAllMeasurements() async{
    var dbBook = await db;
    var result = await dbBook.rawQuery("SELECT * FROM $MedicinesTable");
    return result.toList();
  }

  Future<Medicine> getMedicine(int ID) async{
    var dbBook = await db;
    var result = await dbBook.rawQuery('SELECT * FROM $MedicinesTable WHERE $columnId = $ID');
    if (result.length == 0) return null;
    return new Medicine.fromMap(result.first);
  }

  Future<int> deleteMeasurement(int ID) async{
    var dbBook = await db;
    return await dbBook.delete(MedicinesTable, where: 'id = ?', whereArgs: [ID]);

  }

  Future<int> updateMeasurement(Medicine book) async {
    var dbBook = await db;
    return await dbBook.update(MedicinesTable, book.toMap(), where: "id = ?", whereArgs: [book.id]);
  }

  Future close() async {
    var dbBook = await db;
    return dbBook.close();
  }


}