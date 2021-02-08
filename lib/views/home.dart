import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('titles.home'.tr(), context),
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
                'messages.welcom'.tr(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                'messages.greeting'.tr(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                'messages.institue'.tr(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
