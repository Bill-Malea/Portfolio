import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/MessageModel.dart';
import '../models/project_model.dart';
import 'package:http/http.dart ' as http;

class Projectsprovider extends ChangeNotifier {

Map<String,String> links = {
'Cv':"https://drive.google.com/file/d/1mZdLT2kdVw24eMy8AVWhvLfoHTxRm74z/view?usp=sharing",
'Linkedin':"https://www.linkedin.com/in/bill-malea",
'Facebook':"https://twitter.com/billmalea",
'Twitter':"https://twitter.com/billmalea",
'Github':"https://github.com/Bill-Malea",
'Instagram':"https://www.instagram.com/Bill-Malea",
};


  final List<Project> _project = [];
  List<Project> get projects {
    return [..._project];
  }

  Future<void> loadprojects() async {
    final uri = Uri.parse(
        'https://foodie-test-9da37-default-rtdb.firebaseio.com/.json');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      var loadedproject = [];
      data.forEach((id, project) {


        loadedproject.add(project);
        if (kDebugMode) {
          print(project);
          
        }
      });
    }
  }

Future<void> loadconfig() async {
    final uri = Uri.parse(
        'https://foodie-test-9da37-default-rtdb.firebaseio.com/Mpesa.json');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      var loadedproject = [];
      data.forEach((id, project) {


        loadedproject.add(project);
        if (kDebugMode) {
          print(project);
          
        }
      });
    }
  }


  urllauch({required String? link})async{
var _link = Uri.parse(link!);
 if (!await launchUrl(_link)) {
    throw 'Could not launch $link';
  }
  }


sendmessage({required Message message}) async{ 
  try {
    final uri = Uri.parse(
        'https://foodie-test-9da37-default-rtdb.firebaseio.com/Messages.json');

        var _message = {
          'Name':message.name,
          'Email':message.email,
          'Subject':message.subject,
          'Message':message.message,
        };
    var response = await http.post(uri,body: json.encode(_message));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
    
      
    }
    
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
    
}








}
