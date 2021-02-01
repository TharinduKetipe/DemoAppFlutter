import 'package:flutter/material.dart';
import 'package:ServiceDemo/network/webservice.dart';

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
    // Future.delayed(Duration.zero, () async {
    fetchData(); // this return correct value
    // });
  }

  void fetchData() async {
    //POST
    var crt =
        await createPost(context, "This is testing post", "Post Ttile", 1);
    print(crt);

    //GET by ID
    var post = await getPost(context, "2");
    print(post);

    //GET All
    var posts = await getPosts(context);
    print(posts);

    //PUT
    var put = await updatePost(context, "Updated body", "Updated Title", 1, 2);
    print(put);

    //PATCH
    var patch = await updatePostContent(context, "Patch updated body", 3);
    print(patch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Web service sample',
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              color: Colors.white,
              textColor: Colors.blue,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                this.fetchData();
              },
              child: Text(
                "Click to Call Web Service",
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
