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
        padding: EdgeInsets.only(top: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                'Flutter Route Generator Example',
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
                Navigator.pushNamed(context, '/first');
              },
              child: Text(
                "First Page",
                style: TextStyle(
                  fontSize: 14.0,
                ),
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
                Navigator.of(context).pushNamed(
                  '/second',
                  arguments:
                      "Second Page", //This is really importan. Here you should pass every parameter as arguments
                );
              },
              child: Text(
                "Second Page",
                style: TextStyle(
                  fontSize: 14.0,
                ),
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
                Navigator.of(context).pushNamed(
                  '/third',
                  arguments: ThirdPageArguments(
                      "Third Page", "This message pass through named route"),
                );
              },
              child: Text(
                "Third Page",
                style: TextStyle(
                  fontSize: 14.0,
                ),
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
                this.navigateToFourth();
              },
              child: Text(
                "Fourth Page",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            Text(
              this.message,
            ),
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
