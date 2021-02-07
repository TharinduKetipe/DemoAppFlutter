import 'package:flutter/material.dart';

enum ConfirmAction { CANCEL, ACCEPT }

Future<ConfirmAction> alert(
    BuildContext context, title, message, ok, cancel) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          FlatButton(
            child: Text(
              cancel,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: Text(
              ok,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}
