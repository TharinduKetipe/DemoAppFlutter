import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Widget navDrawer(BuildContext context) {
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
            Navigator.pushNamed(context, '/home');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[1]),
          onTap: () {
            Navigator.pushNamed(context, '/industries');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[2]),
          onTap: () {
            Navigator.pushNamed(context, '/users');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[3]),
          onTap: () {
            Navigator.pushNamed(context, '/add_user');
          },
        ),
        separator(context),
        ListTile(
          title: menuTile(context, menus[4]),
          onTap: () {
            Navigator.pop(context);
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
