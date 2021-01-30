import 'package:flutter/material.dart';
import 'package:demo/widgets/form_components.dart';
import 'package:demo/list.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    WhyFarther _selection;
    String selectedOption = "None";
    String dropdownValue = 'One';

    final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Select option :"),
                PopupMenuButton<WhyFarther>(
                  onSelected: (WhyFarther result) {
                    setState(() {
                      selectedOption = result.toString();
                      print(selectedOption);
                      _selection = result;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<WhyFarther>>[
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.harder,
                      child: Text('Working a lot harder'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.smarter,
                      child: Text('Being a lot smarter'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.selfStarter,
                      child: Text('Being a self-starter'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.tradingCharter,
                      child: Text('Placed in charge of trading charter'),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              dropdownValue,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.grey),
            ),
            RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.black45,
                      Colors.blueGrey,
                      Colors.blue,
                      Colors.lightBlue
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('Gradient Button',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 0),
              child: FlatButton(
                textTheme: ButtonTextTheme.normal,
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  print("Flat button tapped");
                },
                child: Text(
                  "Flat Button",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            //Text Field
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
                obscureText: true,
              ),
            ),
            //Text Form Field
            Container(
              margin: EdgeInsets.all(25),
              child: Form(
                  child: customTextField(context, false, "Email",
                      "example.email.com", "help", "Email is required")),
            ),
            //Image
            Container(
              margin: EdgeInsets.all(5),
              width: 100,
              height: 100,
              child: Form(
                  child: Image(image: AssetImage('assets/images/avatar.jpg'))),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: 100,
              height: 100,
              child: Form(
                  child: Image(
                      image: NetworkImage(
                          'https://www.gardeningknowhow.com/wp-content/uploads/2019/11/red-rose.jpg'))),
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ListPage()));
            // this._showMyDialog();
          },
          icon: Icon(Icons.arrow_forward),
          label: Text('List Page')),
    );
  }

  _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// var height = AppBar().preferredSize.height;
