import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/widgets/appbar.dart';
import 'package:demo/widgets/drawer.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('titles.users'.tr(), context),
      drawer: navDrawer(context),
      body: Center(
          child: Container(
        padding: EdgeInsets.only(top: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                'Profile',
              ),
            ),
          ],
        ),
      )),
    );
  }
}
