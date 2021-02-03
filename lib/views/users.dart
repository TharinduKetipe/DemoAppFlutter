import 'package:demo/models/industry.dart';
import 'package:flutter/material.dart';
import 'package:demo/widgets/appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/views/cards/user_card.dart';
import 'package:demo/network/webservices.dart';

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
  List<Industry> industries;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await getIndustries(context);
    if (res != null) {
      setState(() {
        industries = res.industries;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('titles.industries'.tr(), context),
        body: industries != null
            ? ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  // print(stories[index]);
                  return userItem(context, industries[index]);
                },
                separatorBuilder: (BuildContext context, index) {
                  return Divider(
                    height: 2.0,
                    color: Colors.transparent,
                  );
                },
                itemCount: industries.length)
            : Container());
  }
}
