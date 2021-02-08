import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/widgets/appbar.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/views/cards/user_card.dart';
import 'package:demo/commons/db_herlper.dart';
import 'package:demo/models/user_model.dart';
import 'package:demo/widgets/flushbar.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final dbHelper = DbHelper.instance;
  List<User> users;

  void deleteCallback(int id) async {
    deleteUser(id);
  }

  void deleteUser(int id) async {
    var status = await dbHelper.deleteData(id);
    if (status > 0) {
      showFloatingFlushbar(context, 'flushbar.user_delete_success'.tr(), false);
    } else {
      showFloatingFlushbar(context, 'flushbar.user_delet_fail'.tr(), false);
    }
    setState(() {
      fetchData();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    users = await dbHelper.getAllUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('titles.users'.tr(), context),
        drawer: navDrawer(context),
        body: users != null
            ? ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  // print(stories[index]);
                  return userItem(context, users[index], deleteCallback);
                },
                separatorBuilder: (BuildContext context, index) {
                  return Divider(
                    height: 2.0,
                    color: Colors.transparent,
                  );
                },
                itemCount: users.length)
            : Container());
  }
}
