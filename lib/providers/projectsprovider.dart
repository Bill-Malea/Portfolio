import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/models/LinksModel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/MessageModel.dart';
import '../models/project_model.dart';
import 'package:http/http.dart ' as http;

class Projectsprovider extends ChangeNotifier {

List<Links> _links =[];
Links links (){
  return _links[0];
} 


// {
// 'Cv':"https://drive.google.com/file/d/1mZdLT2kdVw24eMy8AVWhvLfoHTxRm74z/view?usp=sharing",
// 'Linkedin':"https://www.linkedin.com/in/bill-malea",
// 'Facebook':"https://twitter.com/billmalea",
// 'Twitter':"https://twitter.com/billmalea",
// 'Github':"https://github.com/Bill-Malea",
// 'Instagram':"https://www.instagram.com/Bill-Malea",
// };


 List<Project> _project = [];
  List<Project> get projects {
    return _project;
  }

  Future<List<Project>> loadprojects() async {
    List<Project> loadedproject = [];
    try {
       await loadconfig();
    final uri = Uri.parse(
        'https://portfolio-78c9d-default-rtdb.firebaseio.com/Projects.json');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      
      data.forEach((id, project) {
      
        loadedproject.add(Project(image:project[ 'Image'],
        name:project[ 'Name'],
         description: project[ 'Description'], 
         link: project[ 'Link']));
   
     _project = loadedproject;
        notifyListeners();
      });
    }
    } on SocketException{
      errorToast('Check Your Internet Connection');
    }
    
     catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
   return loadedproject;
  }

Future<void> loadconfig() async {
    final uri = Uri.parse(
        'https://portfolio-78c9d-default-rtdb.firebaseio.com/Config.json');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<Links> loadedconfig = [];
      data.forEach((id, project) {
        
        loadedconfig.add(Links(
          cv: project['Cv'],
          facebook: project['Facebook'],
          linkedin: project['Linkedin'],
          instalink: project['Instagram'],
          twitterlink: project['Twitter'],
          github: project['Github'],
          ));

          _links = loadedconfig;
          notifyListeners();
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
