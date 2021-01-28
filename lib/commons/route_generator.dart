import 'package:demo/views/login.dart';
import 'package:flutter/material.dart';
import 'package:demo/views/home.dart';
import 'package:demo/views/users.dart';
import 'package:demo/views/user_profile.dart';
import 'package:demo/commons/utilities.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        if (Utilities.isLoggedIn()) {
          return MaterialPageRoute(builder: (_) => HomePage());
        } else {
          return MaterialPageRoute(builder: (_) => LoginPage());
        }
        return _errorRoute();
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/users':
        return MaterialPageRoute(builder: (_) => UsersPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return _errorRoute();
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
