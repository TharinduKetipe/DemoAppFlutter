import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:demo/models/user_model.dart';

class DbHelper {
  //define db name and table, column names
  static final _dbName = "demo.db";
  static final _dbVersion = 1;

  static final _table = "user";

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnEmail = 'email';

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
        $columnEmail TEXT
        )
    ''');
  }

//insert record
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_table, row);
  }

//get all users
  Future<List<User>> getAllUsers() async {
    var res = await instance.queryAllRows();
    var users = new List<User>();
    if (res != null) {
      res.forEach((v) {
        users.add(new User.fromJson(v));
      });
    }
    return users;
  }

//get all records
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(_table);
  }

//delete record
  Future<int> deleteData(int id) async {
    Database db = await instance.database;
    return await db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }
}
