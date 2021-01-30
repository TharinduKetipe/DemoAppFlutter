import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                width: width / 2,
                height: height,
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 50,
                      color: Colors.yellow,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 100,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 25,
                      color: Colors.orange,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 30,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(7),
                            width: 10,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.all(7),
                            width: 10,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.all(7),
                            width: 10,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.all(7),
                            width: 10,
                            color: Colors.black,
                          ),
                          Text("Demo layout")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: width / 2,
                height: height,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// TextFormField(
//   keyboardType: TextInputType.emailAddress,
//   // validator:
//   decoration: InputDecoration(
//       fillColor: Colors.grey,
//       labelText: 'Email',
//       hintText: 'example@gmail.com',
//       helperText: 'help text',
//       errorText: 'Email is required',
//       hoverColor: Colors.grey),
// )

// Image(image: AssetImage('path'))

// Image(image:NetworkImage(url))
