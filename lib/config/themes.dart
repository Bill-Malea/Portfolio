import 'package:flutter/material.dart';

darkTheme(context) {
  return ThemeData(
    fontFamily: 'GoogleSansRegular',
    textTheme: const TextTheme(titleSmall: TextStyle(
      fontSize: 11
    )),
    primarySwatch: Colors.pink,
    primaryColor: Colors.black,
    disabledColor: Colors.grey,
    cardColor: Colors.pink,
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.dark(),
        buttonColor: Colors.blue,
        splashColor: Colors.black),
    appBarTheme: const AppBarTheme(
        elevation: 0.0, color: Colors.pink),
  );
}

lightTheme(context) {
  return ThemeData(
    fontFamily: 'GoogleSansRegular',  textTheme: const TextTheme(titleSmall: TextStyle(
      fontSize: 11
    )),
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    // ignore: deprecated_member_use
    accentColor: Colors.blue,
    disabledColor: Colors.grey,
    cardColor: Colors.blue,
    canvasColor: Colors.white,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      elevation: 0.0,
    ),
  );
}
