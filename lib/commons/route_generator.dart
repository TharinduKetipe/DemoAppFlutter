import 'package:demo/views/fourth_page.dart';
import 'package:demo/views/home.dart';
import 'package:flutter/material.dart';
import 'package:demo/views/first_page.dart';
import 'package:demo/views/second_page.dart';
import 'package:demo/views/third_page.dart';
import 'package:demo/commons/arguements.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/first':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        // If we passing a data, we should validate the data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(title: args),
          );
        }
        return _errorRoute(); // If args is not of the correct type, return an error page.
      case '/third':
        if (args is ThirdPageArguments) {
          return MaterialPageRoute(
            builder: (_) => ThirdPage(data: args),
          );
        }
        return _errorRoute(); // If args is not of the correct type, return an error page.
      case '/fourth':
        return MaterialPageRoute(builder: (_) => FourthPage());
      default:
        return _errorRoute(); // If there is no such named route in the switch statement, e.g. /fifth
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
