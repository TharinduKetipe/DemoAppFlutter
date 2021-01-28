import 'package:flutter/material.dart';
import 'package:demo/commons/arguements.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var message = "This will show you message from fourth screen.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        color: Colors.yellow,
        padding: EdgeInsets.only(top: 55, left: 0, right: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                'Container Margin Example',
              ),
            ),
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                padding:
                    EdgeInsets.only(top: 25, bottom: 25, left: 25, right: 25),
                margin:
                    EdgeInsets.only(top: 25, bottom: 25, left: 55, right: 25),
                width: 300,
                height: 300,
                // color: Colors.blue,
                child: Container(
                  color: Colors.red,
                  child: Text(
                    'This is sample container.',
                  ),
                )),
          ],
        ),
      )),
    );
  }

  void navigateToFourth() async {
    //Use the same material route way to get data back
    var msg = await Navigator.pushNamed(context, '/fourth');
    setState(() {
      this.message = msg;
    });
  }
}
