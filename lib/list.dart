import 'package:flutter/material.dart';
import 'package:demo/widgets/form_components.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<String> names = <String>[
    'Saman',
    'Kamal',
    'Anil',
    'Nimal',
    'Perera',
    'Silva',
    'Kamal',
    'Anil',
    'Nimal',
    'Perera'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View"),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                margin: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Image(
                        image: NetworkImage(
                            'https://www.gardeningknowhow.com/wp-content/uploads/2019/11/red-rose.jpg')),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(names[index]),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              );
            }));
  }
}

// var height = AppBar().preferredSize.height;
