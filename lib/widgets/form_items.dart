import 'package:flutter/material.dart';

Widget formLabel(text, context) {
  return Text(
    text,
    style: Theme.of(context).inputDecorationTheme.labelStyle,
  );
}

Widget emailField(validateEmail, onSaved, context) {
  return Material(
      elevation: 5.0,
      shadowColor: Colors.black,
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).hintColor, width: 1.0),
              borderRadius: BorderRadius.zero,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).hintColor, width: 1.0),
              borderRadius: BorderRadius.zero,
            ),
            fillColor: Colors.white,
            hintText: 'youremail@example.com',
          ),
          validator: validateEmail,
          onSaved: onSaved));
}

Widget passwordField(validatePassword, onSaved, context, obscureText,
    [txtControl]) {
  return Material(
      elevation: 5.0,
      shadowColor: Colors.black,
      child: TextFormField(
          controller: txtControl,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).hintColor, width: 1.0),
              borderRadius: BorderRadius.zero,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).hintColor, width: 1.0),
              borderRadius: BorderRadius.zero,
            ),
            fillColor: Colors.white,
          ),
          validator: validatePassword,
          onSaved: onSaved));
}

Widget submitButton(text, onPressed, width, height, context) {
  return ButtonTheme(
      minWidth: width,
      height: height,
      child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(height / 2)),
          elevation: 4.0,
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4,
          ),
          onPressed: onPressed));
}
