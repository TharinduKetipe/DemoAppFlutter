import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:demo/models/user_model.dart';
import 'package:demo/widgets/alert.dart';

Container userItem(BuildContext context, User user, callback) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  void deleteAlert(BuildContext context) async {
    var res = await alert(context, 'alert.title'.tr(),
        'alert.delete_message'.tr(), 'alert.yes'.tr(), 'alert.no'.tr());
    if (res == ConfirmAction.ACCEPT) {
      callback(user.id);
    }
  }

  void deleteConfirm() {
    deleteAlert(context);
  }

  return Container(
    height: height / 6,
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    child: Card(
      child: GestureDetector(
        onTap: () {
          print("Cell is clicked.");
          //Navigate to user profile
        },
        child: Row(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0, left: 0, right: 0),
            child: Image.asset(
              'assets/images/login.jpg',
              height: height / 6,
              width: width / 4,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, top: 15),
                width: width / 3,
                height: (height / 6 - 40) / 2,
                child: Text(
                  user.name,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, top: 5),
                height: (height / 6 - 40) / 2,
                width: width / 3,
                child: Text(
                  user.email,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ),
            ],
          ),
          Container(
            width: (width / 3) - 30,
            height: height / 12,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(bottom: 0, right: 15),
            child: RaisedButton(
              onPressed: () {
                deleteConfirm();
              },
              textColor: Colors.white,
              color: Colors.red,
              padding: const EdgeInsets.all(5),
              child: new Text(
                'buttonTitles.delete'.tr(),
              ),
            ),
          )
        ]),
      ),
    ),
    decoration: new BoxDecoration(boxShadow: [
      new BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 5.0,
      ),
    ]),
  );
}
