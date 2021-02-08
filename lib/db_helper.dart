import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:db_demo/dog.dart';

class DbHelper {
  //define db name and table, column names
  static final _dbName = "sample.db";
  static final _dbVersion = 1;

  static final _table = "dog";

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnAge = 'age';

//database service instance
  static Database _database;

//create private instance of DbHelper class
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

//Return singleton instance of database service
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

//initialize database service
  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

//create required db tables when the time database is creating
  Future _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE $_table(
       $columnId INTEGER PRIMARY KEY,
        $columnName TEXT, 
        $columnAge INTEGER
        )
    ''');
  }

//insert record to table
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_table, row);
  }

// read all the data from particular table
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(_table);
  }

//filter records according to specific criteria
  Future<List<Map<String, dynamic>>> querySpecific(int age) async {
    Database db = await instance.database;
    return await db.query(_table, where: "age >= ?", whereArgs: [age]);
  }

  //filter records by passing a raw SQL query
  Future<List<Map<String, dynamic>>> rawQuery(int age) async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $_table WHERE age >= ?', [age]);
  }

  //filter records according to specific criteria
  Future<List<Map<String, dynamic>>> getaDatabyId(int id) async {
    Database db = await instance.database;
    return await db.query(_table, where: "id == ?", whereArgs: [id]);
  }

  //delete record by id
  Future<int> deleteData(int id) async {
    Database db = await instance.database;
    return await db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }

  //update record by sending updated object
  Future<int> update(Dog dog) async {
    Database db = await instance.database;
    return await db.update(_table, {columnName: dog.name, columnAge: dog.age},
        where: 'id =?', whereArgs: [dog.id]);
  }
}
