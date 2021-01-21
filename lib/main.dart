import 'package:demo/views/first_page.dart';
import 'package:flutter/material.dart';
import 'package:demo/views/home.dart';
import 'package:demo/views/second_page.dart';
import 'package:demo/views/third_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //Define Route Map for Named Routes
      initialRoute: '/',
      routes: {
        '/first': (context) => FirstPage(), //Named route for first screen
        '/second': (context) => SecondPage(), //Named route for second screen
        '/third': (context) => ThirdPage(), //Named route for third screen
      },
      home: HomePage(title: 'Flutter Routing Example'),
    );
  }
}
