import 'package:flutter/material.dart';
import 'package:demo/widgets/appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/views/cards/user_card.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<String> users = [
    "Kamal Perera",
    "Nimal Dissanayaka",
    "Saman De Silva",
    "Sunil Mendis",
    "Shehan Gunawardana",
    "Sudath Nishantha"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('titles.users'.tr(), context),
        body: ListView.separated(
            itemBuilder: (BuildContext context, index) {
              // print(stories[index]);
              return userItem(context, users[index]);
            },
            separatorBuilder: (BuildContext context, index) {
              return Divider(
                height: 2.0,
                color: Colors.transparent,
              );
            },
            itemCount: users.length));
  }
}
