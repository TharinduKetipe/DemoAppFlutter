import 'package:shared_preferences/shared_preferences.dart';

class Utilities {
  static void saveToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token);
  }

  static Future<String> userToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authToken');
    return token;
  }
}
