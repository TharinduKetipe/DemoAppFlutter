import 'package:demo/network/webservices.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/widgets/alert.dart';

Widget navDrawer(BuildContext context) {
  void logoutAlert(BuildContext context) async {
    var res = await alert(context, 'alert.title'.tr(),
        'alert.logout_message'.tr(), 'alert.yes'.tr(), 'alert.no'.tr());
    if (res == ConfirmAction.ACCEPT) {
      var isLogout = logout(context);
    }
  }

  final menus = [
    'drawer.home'.tr(),
    'drawer.industries'.tr(),
    'drawer.users'.tr(),
    'drawer.add_user'.tr(),
    'drawer.logout'.tr(),
  ];

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'drawer.title'.tr(),
            style: Theme.of(context).appBarTheme.textTheme.headline4,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          title: menuTile(context, menus[0]),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[1]),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/industries');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[2]),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/users');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[3]),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/add_user');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[4]),
          onTap: () {
            logoutAlert(context);
          },
        ),
        separator(context),
      ],
    ),
  );
}

Widget separator(BuildContext context) {
  return Container(
    height: 1,
    color: Theme.of(context).secondaryHeaderColor,
  );
}

Widget menuTile(BuildContext context, name) {
  return Text(
    name,
    style: Theme.of(context).appBarTheme.textTheme.headline5,
  );
}
