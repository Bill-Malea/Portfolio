// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:portfolio/config/constants.dart';
// import 'package:portfolio/models/blog_model.dart';
import 'package:flutter/material.dart';

class Navigations with ChangeNotifier {
  final List<bool> _selectedtab = [
    true,
    false,
    false,
    false,
  ];

  int get selectetab => _select;

  List<bool> get selected => _selectedtab;

  int _select = 0;

  void select(int n) {
    for (int i = 0; i < 4; i++) {
      if (i != n) {
        _selectedtab[i] = false;
        _select = n;
      } else {
        _selectedtab[i] = true;
      }
      notifyListeners();
    }
  }
}
