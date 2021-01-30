import 'package:flutter/material.dart';

Widget customTextField(
    BuildContext context, isSecure, labeltext, hintText, help, error) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    obscureText: isSecure,
    // validator:,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Colors.blue,
        labelText: labeltext,
        hintText: hintText,
        helperText: help,
        errorText: error,
        hoverColor: Colors.grey),
  );
}
