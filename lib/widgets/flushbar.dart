import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFloatingFlushbar(BuildContext context, message) {
  double height = MediaQuery.of(context).size.height;
  Flushbar(
    padding: EdgeInsets.all(10),
    borderRadius: 5,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: EdgeInsets.fromLTRB(15, 23, 15, height / 100 * 5),
    backgroundColor: const Color(0xFFF8D7DA),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    duration: Duration(seconds: 3),
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    borderColor: const Color(0xFFF5C6CB),
    messageText: Text(
      message, // invalid input
      style: TextStyle(color: const Color(0xFFD36D77), fontSize: 11),
      textAlign: TextAlign.center,
    ),
  )..show(context);
}
