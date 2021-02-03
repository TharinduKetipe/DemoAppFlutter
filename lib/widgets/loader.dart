import 'package:flutter/material.dart';

Widget loader(context, height) {
  return Container(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
        ),
      ));
}

void showLoader(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (context) {
            return Material(
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: new Container(
                    width: width,
                    height: height,
                    alignment: Alignment.center,
                    child: loader(context, 40.0),
                  ),
                ));
          }),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: null,
      transitionDuration: const Duration(milliseconds: 150));
}

void stopLoader(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
