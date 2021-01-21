import 'package:flutter/material.dart';
import 'package:demo/commons/arguements.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThirdPageArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 25),
              child: Text(
                args.message,
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              color: Colors.white,
              textColor: Colors.blue,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
