import 'package:flutter/material.dart';
import 'package:db_demo/db_helper.dart';
import 'package:db_demo/dog.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DbHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onClick() async {
    // await saveRecord();
    // await queryAll();
    //await querySpecific();
    //await rawQuery();
    // await genericQuery();
    // await delete();
    //await update();
    await deleteAll();
  }

//save new record in DB
  void saveRecord() async {
    var doggy = Dog(id: generateRandomNumber(), name: "Dogyy", age: 10);
    final id = dbHelper.insert(doggy.toMap());
  }

//read all the data in particular table
  void queryAll() async {
    var allRows = await dbHelper.queryAllRows();
    allRows.forEach((row) {
      print(row);
    });
  }

//filter record by specific criteria
  void querySpecific() async {
    //get all dogs where age > 6
    var dogs = await dbHelper.querySpecific(6);
    dogs.forEach((dog) {
      print(dog);
    });
  }

  //filter record by specific criteria
  void rawQuery() async {
    //get all dogs where age > 6
    var dogs = await dbHelper.rawQuery(6);
    dogs.forEach((dog) {
      print(dog);
    });
  }

//pass sql query and get it executed
  void genericQuery() async {
    //get all dogs where age < 6
    var query = 'SELECT * FROM dog WHERE age <= 6';
    var dogs = await dbHelper.genericQuery(query);
    dogs.forEach((dog) {
      print(dog);
    });
  }

//delete record by id
  void delete() async {
    var row = await dbHelper.deleteData(2752);
    print(row);
  }

  //update record
  void update() async {
    var data = await dbHelper.queryAllRows();
    var first = data[0];
    print(first);
    var lassy = Dog(id: first['id'], name: 'Lassy 002', age: first['age']);

    var res = await dbHelper.update(lassy);
    print(res);
    var newdata = await dbHelper.getaDatabyId(first['id']);
    if (newdata != null) {
      print(newdata[0]);
    }
  }

//delete whole table once
  void deleteAll() async {
    var dogsBefore = await dbHelper.queryAllRows();
    dogsBefore.forEach((dog) {
      print(dog);
    });
    print("******** deleting . . . ************");
    var status = await dbHelper.deleteAll();
    var dogs = await dbHelper.queryAllRows();
    dogs.forEach((dog) {
      print(dog);
    });
  }

  int generateRandomNumber() {
    var random = new Random();
    return random.nextInt(10000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.onClick();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
