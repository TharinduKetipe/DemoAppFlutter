import 'package:demo/commons/utilities.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/widgets/flushbar.dart';
import 'package:demo/commons/globals.dart' as global;
import 'package:demo/models/login_response.dart';
import 'package:demo/widgets/loader.dart';
import 'package:demo/models/industry_response.dart';
import 'package:demo/commons/utilities.dart';

Future<LoginResponse> login(BuildContext context, username, password) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      var params = {"email": username, "password": password};
      showLoader(context);
      final http.Response response = await http.post(global.LOGIN,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params));
      var responseBody = json.decode(response.body);
      stopLoader(context);
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(responseBody);
      } else if (response.statusCode == 400) {
        String message = responseBody['error'];
        showFloatingFlushbar(context, message);
        return null;
      } else {
        showFloatingFlushbar(context, 'errors.login'.tr());
        return null;
      }
    } catch (e) {
      showFloatingFlushbar(context, 'errors.unknown'.tr());
      return null;
    }
  } else {
    showFloatingFlushbar(context, 'errors.network'.tr());
    return null;
  }
}

Future<IndustryResponse> getIndustries(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  var token = await Utilities.userToken();

  if ((connectivityResult == ConnectivityResult.mobile) ||
      (connectivityResult == ConnectivityResult.wifi)) {
    try {
      showLoader(context);
      final http.Response response =
          await http.get(global.INDUSTRIES, headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      });
      var responseBody = json.decode(response.body);
      stopLoader(context);
      if (response.statusCode == 200) {
        return IndustryResponse.fromJson(responseBody);
      } else if (response.statusCode == 403) {
        showFloatingFlushbar(context, 'errors.industries'.tr());
        var isDelete = await Utilities.clearPreferences();
        Navigator.pushNamed(context, '/login');
        return null;
      } else {
        showFloatingFlushbar(context, 'errors.industries'.tr());
        return null;
      }
    } catch (e) {
      print(e);
      showFloatingFlushbar(context, 'errors.unknown'.tr());
      return null;
    }
  } else {
    showFloatingFlushbar(context, 'errors.network'.tr());
    return null;
  }
}
