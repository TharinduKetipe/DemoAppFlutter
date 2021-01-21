import 'package:flutter/material.dart';
import 'package:demo/views/home.dart';
import 'package:demo/commons/route_generator.dart';

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
      //Instead of route map we have set generate route function using onGenerateRoute
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePage(title: 'Flutter Routing Example'),
    );
  }
}
