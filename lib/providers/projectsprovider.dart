import 'package:flutter/cupertino.dart';

import '../config/assets.dart';
import '../models/project_model.dart';

class Projectsprovider extends ChangeNotifier {
  final List<Project> _project = [
    Project(
        name: 'Portfolio',
        image: Assets.truelancer,
        description:
            'My personal portfolio built on flutter web.',
        link:
            'https://play.google.com/store/apps/details?id=com.truelancer.app'),
    Project(
        name: 'Foodie',
        image: Assets.messio,
        description:
            'A fast food delivery mobile app built on flutter for Android and iOs,with firebase as backend intergrating Authentication,Cloud Functions,Cloud Messaging',
        link: 'https://github.com/adityadroid/messio'),
    Project(
        name: 'Bit254',
        image: Assets.savaari_consumer,
        description:
            'A Crypto Currency Wallet built on Bitcoin,Etherium and DogeCoin public blockchain.Accepting sending and receiving Etherium,Bitcoin and Dogecoin selling and buying.Intergrating Mpesa,Equity and Kcb Bank payment modes',
        link:
            'https://play.google.com/store/apps/details?id=com.savaari.app'),
    Project(
        name: 'MovieDen',
        image: Assets.savaari_partner,
        description: 'A movie  mobile app.',
        link:
            'https://play.google.com/store/apps/details?id=com.savaari.driver.app'),
  ];
  List<Project> get projects {
    return [..._project];
  }
}
