import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import 'Measurement.dart';


class DatabaseHelperMeasurement{

  static final DatabaseHelperMeasurement _instance = new DatabaseHelperMeasurement.internal();
  factory  DatabaseHelperMeasurement() => _instance;  //pour que à chaque fois on lance l'app on ne creera pas une nouvelle instace(databae), on utilisera une seule pour toute la durée d'utilidation d'app
  static Database _db;
  /***DB's tables names**/
  final String MeasurementsTable = "MeasurementTable";
  final String columnId = "id";
  final String columnValue = "value";
  final String columnDate = "date";

  /******/

  Future<Database> get db async{
    if (_db != null ){
      return _db;
    }else{
      _db = await initDB();
      return _db;
    }
  }

  DatabaseHelperMeasurement.internal();

  initDB() async {
    Directory documentdiretory = await getApplicationDocumentsDirectory();
    String path = join(documentdiretory.path, "MeasurementsDB.db");

    var ourDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDB;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $MeasurementsTable($columnId INTEGER PRIMARY KEY,$columnValue TEXT, $columnDate TEXT)"
    );
  }

  //CRUD / CREATE, READ, UPDATE AND DELETE

  //INSERTION
  Future<int> saveMeasurement(Measurement measurement) async {
    var dbBook = await db;
    var result = await dbBook.insert("$MeasurementsTable", measurement.toMap());
    return result;
  }

  //GET BOOKS
  Future<List> getAllMeasurements() async{
    var dbBook = await db;
    var result = await dbBook.rawQuery("SELECT * FROM $MeasurementsTable");
    return result.toList();
  }

  Future<Measurement> getMeasurement(int ID) async{
    var dbBook = await db;
    var result = await dbBook.rawQuery('SELECT * FROM $MeasurementsTable WHERE $columnId = $ID');
    if (result.length == 0) return null;
    return new Measurement.fromMap(result.first);
  }

  Future<int> deleteMeasurement(int ID) async{
    var dbBook = await db;
    return await dbBook.delete(MeasurementsTable, where: 'id = ?', whereArgs: [ID]);

  }

  Future<int> updateMeasurement(Measurement book) async {
    var dbBook = await db;
    return await dbBook.update(MeasurementsTable, book.toMap(), where: "id = ?", whereArgs: [book.id]);
  }

  Future close() async {
    var dbBook = await db;
    return dbBook.close();
  }


}