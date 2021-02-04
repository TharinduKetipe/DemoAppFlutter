import 'package:shared_preferences/shared_preferences.dart';

class Utilities {
  static Future<bool> saveToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token);
    return true;
  }

  static Future<String> userToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authToken');
    return token;
  }

  static Future<bool> clearPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return true;
  }
}
