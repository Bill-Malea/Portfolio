import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../models/project_model.dart';
import 'package:http/http.dart ' as http;

class Projectsprovider extends ChangeNotifier {
  final List<Project> _project = [];
  List<Project> get projects {
    return [..._project];
  }

  Future<void> loadprojects() async {
    final uri = Uri.parse(
        'https://foodie-test-9da37-default-rtdb.firebaseio.com/Mpesa.json');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      var loadedproject = [];
      data.forEach((id, project) {
        if (kDebugMode) {
          print(project);
          loadedproject.add(project);
        }
      });
    }
  }
}
