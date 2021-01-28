import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/extensions/color.dart';

//Color theme generate https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=03A9F4
// https://maketintsandshades.com/#03a9f4
ThemeData primaryTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: MaterialColor(
    //https://api.flutter.dev/flutter/material/Colors-class.html
    240116,
    <int, Color>{
      50: HexColor.fromHex("#b3e5fc"),
      100: HexColor.fromHex("#9addfb"),
      200: HexColor.fromHex("#81d4fa"),
      300: HexColor.fromHex("#4fc3f7"),
      400: HexColor.fromHex("#35baf6"),
      500: HexColor.fromHex("#03a9f4"),
      600: HexColor.fromHex("#0398dc"),
      700: HexColor.fromHex("#0287c3"),
      800: HexColor.fromHex("#0276ab"),
      900: HexColor.fromHex("#007ac1")
    },
  ),
  primaryColor: HexColor.fromHex("#03a9f4"),
  fontFamily: 'Lato',
  appBarTheme: AppBarTheme(
      textTheme: TextTheme(
    headline4: TextStyle(
      fontFamily: 'Lato',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  )),
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
  toggleButtonsTheme: ToggleButtonsThemeData(
      //toggle button theme
      ),
  buttonColor: Color(0xff936F3E),
  secondaryHeaderColor: Colors.grey,
  textSelectionColor: Color(0xffB5BFD3),
  cursorColor: Color(0xff936F3E),
  textSelectionHandleColor: Color(0xff936F3E),
  backgroundColor: Color(0xff457BE0),
  dialogBackgroundColor: Colors.white,
  indicatorColor: Color(0xff457BE0),
  hintColor: HexColor.fromHex("#bcbec0"),
  errorColor: Colors.red,
  toggleableActiveColor: Color(0xff6D42CE),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      fontFamily: 'Lato',
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: HexColor.fromHex("#414042"),
    ),
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      fontFamily: 'Lato',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  primaryTextTheme: TextTheme(
      //text theme that contrast with primary color
      ),
  platform: TargetPlatform.android,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  applyElevationOverlayColor: true,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: MaterialColor(
    0xFFF5E0C3,
    <int, Color>{
      50: Color(0x1a5D4524),
      100: Color(0xa15D4524),
      200: Color(0xaa5D4524),
      300: Color(0xaf5D4524),
      400: Color(0x1a483112),
      500: Color(0xa1483112),
      600: Color(0xaa483112),
      700: Color(0xff483112),
      800: Color(0xaf2F1E06),
      900: Color(0xff2F1E06)
    },
  ),
);
