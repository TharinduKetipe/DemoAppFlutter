import 'package:demo/views/fourth_page.dart';
import 'package:flutter/material.dart';
import 'package:demo/views/first_page.dart';
import 'package:demo/views/second_page.dart';
import 'package:demo/views/third_page.dart';
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
        padding: EdgeInsets.only(top: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                'Flutter Routing Example',
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 25),
              child: Text(
                'Material Routes',
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
                //Simple Material Route
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
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
                //Pass data with Material Route

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(
                          title: "This variable is pass through navigation")),
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
            Container(
              padding: EdgeInsets.only(top: 75, bottom: 30),
              child: Text(
                'Named Routes',
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
                //Named Route for first screen
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
                //Pass data with Named route
                var arg = ThirdPageArguments(
                    "Third Page", "This message pass through named route");
                Navigator.pushNamed(context, '/third', arguments: arg);
              },
              child: Text(
                "Third Page",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void navigateToFourth() async {
    //Pass data with Material Route
    var msg = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => FourthPage()),
    );
    setState(() {
      this.message = msg;
    });
  }
}
