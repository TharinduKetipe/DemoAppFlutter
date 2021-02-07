import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/widgets/appbar.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/widgets/form_items.dart';
import 'package:demo/mixins/validation_mixin.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String name = "";
  bool isInvalid = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    double contentGap = height < 750 ? 50 : 80;
    double buttonGap = height < 750 ? 5 : 15;

    return Scaffold(
      appBar: appBar('drawer.add_user'.tr(), context),
      drawer: navDrawer(context),
      body: ListView(children: <Widget>[
        Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 35, right: 35, top: contentGap),
                  child: Form(
                      key: formKey,
                      child: Column(children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: formLabel('labels.email'.tr(), context),
                        ),
                        Container(
                            height: height / 18,
                            padding: EdgeInsets.only(top: 5),
                            child: emailField(validateEmail, (String value) {
                              email = value.trim();
                            }, context)),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.centerLeft,
                          child: formLabel('labels.name'.tr(), context),
                        ),
                        Container(
                            height: height / 18,
                            padding: EdgeInsets.only(top: 5),
                            child: nameField(validateName, (String value) {
                              name = value.trim();
                            }, context)),
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: submitButton('buttonTitles.add'.tr(), () {
                            formKey.currentState.save();
                            if (formKey.currentState.validate()) {}
                          }, width - 70, height / 20, context),
                        ),
                      ])),
                ),
              ]),
        ),
      ]),
    );
  }
}
