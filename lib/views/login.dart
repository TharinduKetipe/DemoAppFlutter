import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:demo/widgets/form_items.dart';
import 'package:demo/mixins/validation_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String token = "";
  bool isInvalid = false;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    double contentGap = height < 750 ? 50 : 80;
    double buttonGap = height < 750 ? 5 : 15;
    double imageSize = height < 750 ? height / 4 : width / 2;

    if (height < 569) {
      contentGap = 30;
      buttonGap = 5;
      imageSize = height / 5;
    }

    var logoImageAsset = new AssetImage("assets/images/login.jpg");
    var logoImage = new Image(
      image: logoImageAsset,
      height: imageSize,
      width: imageSize,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('titles.login'.tr(),
            style: Theme.of(context).appBarTheme.textTheme.headline4),
      ),
      body: ListView(children: <Widget>[
        Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: width / 4, right: width / 4, top: contentGap),
                  child: logoImage,
                ),
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
                          child: formLabel('labels.password'.tr(), context),
                        ),
                        Container(
                            height: height / 18,
                            padding: EdgeInsets.only(top: 5),
                            child:
                                passwordField(validatePassword, (String value) {
                              password = value;
                            }, context, _obscureText)),
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: submitButton('buttonTitles.login'.tr(), () {
                            formKey.currentState.save();
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
